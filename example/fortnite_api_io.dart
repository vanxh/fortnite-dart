import "package:fortnite/fortnite.dart";
import "package:fortnite/src/fortnite_api_io/structures/challenges.dart";

void main() async {
  final FortniteApiIo fn = FortniteApiIo(
    apiKey: "2840821f-df7a0c5e-891f3bb7-df9aa92a",
  );

  ChallengeResponse c = await fn.getChallenges();
  print("There are ${c.bundles.length} challenge bundles available.");
}
