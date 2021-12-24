import "package:logging/logging.dart";
import "package:fortnite/src/client/http.dart";
import "package:fortnite/src/structures/client_options.dart";
import "package:fortnite/src/structures/http_response.dart";
import "package:fortnite/resources/auth_clients.dart";
import "auth.dart";

/// client object log levels
enum LogLevel {
  debug,
  info,
  warning,
  error,
  wtf,
}

/// invalid bearer token errors
List<String> invalidTokenErrorCodes = [
  "errors.com.epicgames.common.authentication.token_verification_failed",
  "errors.com.epicgames.common.oauth.invalid_token",
  "errors.com.epicgames.common.authentication.authentication_failed",
];

/// client object
class Client {
  /// options for the client
  late final ClientOptions _clientOptions;

  /// logger for the client
  final Logger _logger = Logger("FORTNITE CLIENT");

  /// http client for client
  late final HTTP http;

  late FortniteAuth auth;

  /// session for the account
  String session = "";

  /// the main client object
  Client({
    required ClientOptions options,
    String overrideSession = "",
  }) {
    _clientOptions = options;

    Logger.root.level = _clientOptions.logLevel;
    Logger.root.onRecord.listen((record) {
      print(
          '${record.time.toString().split(" ")[1].split(".")[0]} [${record.level.name}] ${record.message}');
    });

    /// initialize http object
    http = HTTP(
      client: this,
    );

    /// initialize auth object
    auth = FortniteAuth(this);

    if (overrideSession != "") {
      session = overrideSession;
    }

    log(LogLevel.info, "Initialized fortnite client object");
  }

  /// returns display name of client
  String get displayName => _clientOptions.deviceAuth.displayName;

  /// returns account id of client
  String get accountId => _clientOptions.deviceAuth.accountId;

  /// returns device id of client
  String get deviceId => _clientOptions.deviceAuth.deviceId;

  /// returns device auth secret of client
  String get secret => _clientOptions.deviceAuth.secret;

  /// log function
  void log(LogLevel l, String message) {
    if (_clientOptions.log == false) return;

    switch (l) {
      case LogLevel.debug:
        _logger.fine(message);
        break;

      case LogLevel.info:
        _logger.info(message);
        break;

      case LogLevel.warning:
        _logger.warning(message);
        break;

      case LogLevel.error:
        _logger.severe(message);
        break;

      case LogLevel.wtf:
        _logger.shout(message);
        break;
    }
  }

  /// Refresh session of the account
  Future<dynamic> refreshSession() async {
    log(LogLevel.debug,
        "Refreshing session for ${_clientOptions.deviceAuth.accountId}");

    session = await auth.createOAuthToken(
      grantType: "device_auth",
      authClient: AuthClients().fortniteIOSGameClient,
      grantData:
          "account_id=${_clientOptions.deviceAuth.accountId}&device_id=${_clientOptions.deviceAuth.deviceId}&secret=${_clientOptions.deviceAuth.secret}",
    );

    return session;
  }

  /// send request to epic games
  ///
  /// [method] method request to [url] with [body] body
  Future<dynamic> send({
    required String method,
    required String url,
    dynamic body,
    bool dontRetry = false,
  }) async {
    HttpResponse res = await http.send(
      method: method,
      url: url,
      headers: {
        "User-Agent": _clientOptions.userAgent,
        "Authorization": "bearer $session",
      },
      body: body,
    );

    if (res.success) {
      return res.data;
    } else {
      String errorCode = res.error["errorCode"];

      if (invalidTokenErrorCodes.contains(errorCode) && !dontRetry) {
        await refreshSession();
        return await send(
          method: method,
          url: url,
          body: body,
          dontRetry: true,
        );
      }

      throw Exception(res.error["errorCode"] ?? res.error);
    }
  }
}
