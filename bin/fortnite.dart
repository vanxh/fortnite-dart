import 'package:fortnite/fortnite.dart';
import 'package:fortnite/src/structures/client_options.dart';
import 'package:fortnite/src/structures/device_auth.dart';

void main() {
  Client client = Client(
    options: ClientOptions(
      log: true,
      deviceAuth: DeviceAuth(
        accountId: "",
        deviceId: "",
        secret: "",
      ),
    ),
  );
}
