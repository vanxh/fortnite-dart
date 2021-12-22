import "dart:convert";

class AuthClients {
  String _convertToBase64(String text) {
    return base64.encode(utf8.encode(text));
  }

  String get fortnitePCGameClient => _convertToBase64(
      "ec684b8c687f479fadea3cb2ad83f5c6:e1f31c211f28413186262d37a13fc84d");
  String get fortniteIOSGameClient => _convertToBase64(
      "3446cd72694c4a4485d81b77adbb2141:9209d4a5e25a457fb9b07489d313b41a");
  String get fortniteAndroidGameClient => _convertToBase64(
      "3f69e56c7649492c8cc29f1af08a8a12:b51ee9cb12234f50a69efa67ef53812e");
  String get fortniteSwitchGameClient => _convertToBase64(
      "5229dcd3ac3845208b496649092f251b:e3bd2d3e-bf8c-4857-9e7d-f3d947d220c7");
  String get fortniteCNGameClient => _convertToBase64(
      "efe3cbb938804c74b20e109d0efc1548:6e31bdbae6a44f258474733db74f39ba");
  String get launcherAppClient2 => _convertToBase64(
      "34a02cf8f4414e29b15921876da36f9a:daafbccc737745039dffe53d94fc76cf");
}
