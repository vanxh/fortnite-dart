import 'package:logging/logging.dart';
import 'package:fortnite/src/structures/client_options.dart';
import 'package:fortnite/src/client/http.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error,
  wtf,
}

class Client {
  /// options for the client
  late final ClientOptions _clientOptions;

  /// logger for the client
  final Logger _logger = Logger("FORTNITE CLIENT");

  /// http client for client
  late final HTTP http;

  /// the main client object
  Client({
    required ClientOptions options,
  }) {
    _clientOptions = options;

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print(
          '${record.time.toString().split(" ")[1].split(".")[0]} [${record.level.name}] ${record.message}');
    });

    /// initialize http object
    http = HTTP(
      client: this,
    );

    log(LogLevel.info, "Initialized fortnite client object");
  }

  /// log
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
}
