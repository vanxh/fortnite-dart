import 'package:dio/dio.dart';
import 'client.dart';

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
      throw Exception('restRetryLimit must be greater than 0');
    }

    client.log(LogLevel.info, "Initialized HTTP client object");
  }
}
