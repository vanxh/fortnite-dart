import "package:fortnite/fortnite_api_io.dart";

void main() async {
  final FortniteApiIo fn = FortniteApiIo(
    apiKey: "YOUR API KEY",
  );

  ChallengeResponse c = await fn.getChallenges();
  print("There are ${c.bundles.length} challenge bundles available.");
}
