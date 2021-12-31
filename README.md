# Fortnite

A fortnite api manager library for dart inspired by [fnbr.js](https://github.com/fnbrjs/fnbr.js).

[![pub.dev Version](https://img.shields.io/pub/v/fortnite.svg)](https://pub.dev/packages/fortnite/)
[![Discord Server](https://discord.com/api/guilds/797736897941995540/widget.png)](https://discord.gg/fishstick)

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
    fortnite: any
```

then run in terminal

```
dart pub get
```

or use your prefferd text editor or IDE to install the plugin.

## Usage Example

```dart
import "dart:io";
import "dart:convert";
import "package:fortnite/fortnite.dart";
import "package:logging/logging.dart";

final File deviceAuthFile = File("device_auth.json");

// main function
void main() async {
  DeviceAuth deviceAuth;

  if (!(await deviceAuthFile.exists())) {
    /// get an authorization code url
    String authorizationCodeURL = getAuthorizationCodeURL(
      forceLogin: false,
    );

    /// print the url to the console
    print("Get an authorization code from here: $authorizationCodeURL");

    stdout.write("Enter an authorization code: ");
    String authorizationCode = stdin.readLineSync() ?? "";

    /// get an authorization code from previous url and use it to create a device auth.
    /// a device auth dont gets invalid until you forcefully delete it or change your password.
    deviceAuth = await authenticateWithAuthorizationCode(
      authorizationCode, // authorization code
    );

    /// write the device auth to a file
    await deviceAuthFile.writeAsString(
      JsonEncoder().convert({
        "accountId": deviceAuth.accountId,
        "deviceId": deviceAuth.deviceId,
        "secret": deviceAuth.secret,
        "displayName": deviceAuth.displayName,
      }),
    );
  }

  /// read the device auth from the file
  final Map<String, dynamic> deviceAuthDetails =
      jsonDecode(await deviceAuthFile.readAsString());

  /// create the device object
  deviceAuth = DeviceAuth.fromJson(deviceAuthDetails);

  /// create the client object
  final Client client = Client(
    options: ClientOptions(
      log: true,
      deviceAuth: deviceAuth,
      logLevel: Level.ALL,
    ),
    overrideSession: "",
  )..onSessionUpdate.listen((update) {
      print("Session updated for ${update.accountId}");

      /// Any function you want to do with updated session.
    });

  /// initialize the common core profile for the client
  await client.commonCore.init();

  /// print vbucks from common core profile data
  print(
      "${client.displayName} you have ${client.commonCore.totalVbucks} V-Bucks");
}
```

## Links

-   [Discord](https://discord.gg/fishstick)
-   [pub.dev](https://pub.dev/packages/fortnite/)
-   [Documentation](https://pub.dev/documentation/fortnite/latest/)

## License

Copyright 2021 Vanxh

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
