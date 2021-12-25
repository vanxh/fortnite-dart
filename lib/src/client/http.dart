import "package:dio/dio.dart";
import "client.dart";
import "../structures/http_response.dart";

/// custom HTTP class
class HTTP {
  /// 5xx Server Errors retry limit
  int restRetryLimit;

  /// The main client object
  Client client;

  /// Dio client object
  final Dio _dioClient = Dio();

  /// HTTP constructor
  HTTP({required this.client, this.restRetryLimit = 5}) {
    if (restRetryLimit <= 0) {
      throw Exception("restRetryLimit must be greater than 0");
    }

    client.log(LogLevel.info, "Initialized HTTP client object");
  }

  /// Send request
  Future<HttpResponse> send({
    required String method,
    required String url,
    required Map<String, dynamic> headers,
    dynamic body,
    ResponseType responseType = ResponseType.json,
    int retries = 0,
  }) async {
    int start = DateTime.now().millisecondsSinceEpoch;

    try {
      var res = await _dioClient.fetch(RequestOptions(
        method: method,
        path: url,
        headers: headers,
        data: body,
        responseType: responseType,
      ));

      client.log(
        LogLevel.debug,
        "$method $url [${((DateTime.now().millisecondsSinceEpoch - start) / 1000).toStringAsFixed(2)}s]: ${res.statusCode ?? "???"} ${res.statusMessage ?? ""}",
      );

      return HttpResponse(
        success: true,
        data: res.data,
      );
    } on DioError catch (e) {
      client.log(
        LogLevel.debug,
        "$method $url [${((DateTime.now().millisecondsSinceEpoch - start) / 1000).toStringAsFixed(2)}s]: ${e.response?.statusCode ?? "???"} ${e.response?.statusMessage ?? ""}",
      );

      int status = e.response?.statusCode ?? 0;

      if (status.toString().startsWith("5") && retries < restRetryLimit) {
        return await send(
          method: method,
          url: url,
          headers: headers,
          body: body,
          responseType: responseType,
          retries: retries + 1,
        );
      }

      if (status == 429 ||
          e.response?.data?["errorCode"] ==
              "errors.com.epicgames.common.throttled") {
        int retryAfter = 5;
        await Future.delayed(Duration(seconds: retryAfter + 5), () async {
          return await send(
            method: method,
            url: url,
            headers: headers,
            body: body,
            responseType: responseType,
            retries: retries + 1,
          );
        });
      }

      return HttpResponse(
        success: false,
        error: e.response?.data ?? e.message,
      );
    }
  }

  /// get request
  Future<HttpResponse> get({
    required String url,
    required Map<String, dynamic> headers,
  }) async {
    return await send(
      method: "GET",
      url: url,
      headers: headers,
    );
  }

  /// post request
  Future<HttpResponse> post({
    required String url,
    required Map<String, dynamic> headers,
    dynamic body,
  }) async {
    return await send(
      method: "POST",
      url: url,
      headers: headers,
      body: body,
    );
  }
}
