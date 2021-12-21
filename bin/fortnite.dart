import 'package:fortnite/fortnite.dart';

void main() async {
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
  // dynamic res = await client.send(
  //   method: "POST",
  //   url: MCP(
  //     FortniteProfile.campaign,
  //     accountId: client.accountId,
  //   ).QueryProfile,
  //   body: {},
  // );
  // print(res);
}
