import 'package:fortnite/fortnite.dart';
import 'package:fortnite/src/structures/client_options.dart';

void main() {
  Client client = Client(
    options: ClientOptions(
      log: true,
    ),
  );
}
