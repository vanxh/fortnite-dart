import "dart:async";
import "package:logging/logging.dart";
import "http.dart";
import "auth.dart";
import "athena_profile.dart";
import "common_core_profile.dart";
import "campaign_profile.dart";
import "../structures/client_options.dart";
import "../structures/http_response.dart";
import "../structures/avatar.dart";
import "../structures/invalid_account_exception.dart";
import "../structures/player.dart";
import "../../resources/endpoints.dart";
import "../../resources/auth_clients.dart";

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

  /// auth client for client
  late FortniteAuth auth;

  /// athena profile for client
  late AthenaProfile athena;

  /// common core profile for client
  late CommonCoreProfile commonCore;

  /// campaign profile for client
  late CampaignProfile campaign;

  /// session for the account
  String session = "";

  /// session update controller
  final StreamController<Client> _sessionUpdateController =
      StreamController.broadcast();

  /// invalid account controller
  final StreamController<InvalidAccountException> _invalidAccountController =
      StreamController.broadcast();

  /// the main client object
  Client({
    required ClientOptions options,
    String overrideSession = "",
  }) {
    _clientOptions = options;

    Logger.root.level = _clientOptions.logLevel;
    Logger.root.onRecord.listen((record) {
      // print(
      //     '${record.time.toString().split(" ")[1].split(".")[0]} [${record.level.name}] ${record.message}');
    });

    /// initialize http object
    http = HTTP(
      client: this,
    );

    /// initialize auth object
    auth = FortniteAuth(this);

    /// initialize athena object
    athena = AthenaProfile(this);

    /// initialize common core profile object
    commonCore = CommonCoreProfile(this);

    /// initialize campaign profile object
    campaign = CampaignProfile(this);

    if (overrideSession != "") {
      session = overrideSession;
    }

    log(LogLevel.info, "Initialized fortnite client object [$accountId]");
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

  /// returns the session update event stream
  Stream<Client> get onSessionUpdate => _sessionUpdateController.stream;

  /// returns the invalid account event stream
  Stream<InvalidAccountException> get onInvalidAccount =>
      _invalidAccountController.stream;

  /// send invalid account error
  void sendInvalidAccountError() {
    _invalidAccountController.add(
      InvalidAccountException(
        accountId: accountId,
        message: "Your account credentials are invalid.",
      ),
    );
  }

  /// Refresh session of the account
  Future<dynamic> refreshSession() async {
    log(LogLevel.info,
        "Refreshing session for ${_clientOptions.deviceAuth.accountId}");

    session = await auth.createOAuthToken(
      grantType: "device_auth",
      authClient: AuthClients().fortniteIOSGameClient,
      grantData:
          "account_id=${_clientOptions.deviceAuth.accountId}&device_id=${_clientOptions.deviceAuth.deviceId}&secret=${_clientOptions.deviceAuth.secret}",
    );

    _sessionUpdateController.add(this);

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
    String? overrideToken,
  }) async {
    HttpResponse res = await http.send(
      method: method,
      url: url,
      headers: {
        "User-Agent": _clientOptions.userAgent,
        "Authorization": "bearer ${overrideToken ?? session}",
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

      throw Exception(res.error["errorMessage"] ?? res.error);
    }
  }

  /// send a get request to epic games.
  ///
  /// get request to [url].
  Future<dynamic> get(
    String url, {
    String? overrideToken,
  }) async =>
      await send(method: "GET", url: url, overrideToken: overrideToken);

  /// send a post request to epic games.
  ///
  /// post request to [url] with [body].
  Future<dynamic> post(
    String url, {
    dynamic body = const {},
    String? overrideToken,
  }) async =>
      await send(
        method: "POST",
        url: url,
        body: body,
        overrideToken: overrideToken,
      );

  /// returns the avatar of the given account ids
  Future<List<Avatar>> getAvatars(List<String> accountIds) async {
    List<Avatar> avatars = [];

    for (int i = 0; i < accountIds.length; i += 100) {
      List<String> ids = accountIds.sublist(
          i, i + 100 > accountIds.length ? accountIds.length : i + 100);

      var res = await send(
        method: "GET",
        url: "${Endpoints().accountAvatars}?accountIds=${ids.join(",")}",
      ) as List;

      for (var a in res) {
        avatars.add(Avatar(a["accountId"], a["avatarId"]));
      }
    }

    return avatars;
  }

  /// find players by name
  Future<List<Player>> findPlayers(String prefix) async {
    List<Player> players = [];

    var res = await send(
      method: "GET",
      url:
          "${Endpoints().userSearch}/$accountId?prefix=${Uri.encodeQueryComponent(prefix)}&platform=EPIC",
    );

    for (final p in res) {
      players.add(Player(
        p["accountId"],
        displayName: (p["matches"] as List?)?.first?["value"] ?? p["accountId"],
      ));
    }

    return players;
  }
}
