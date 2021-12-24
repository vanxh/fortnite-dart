/// item shop response
class ShopResponse {
  /// result of shop response
  late bool result = false;

  /// is it full shop
  late bool fullShop = false;

  /// when did shop last updated
  late dynamic lastUpdate;

  /// current rotations
  late dynamic currentRotation;

  /// next rotation time
  late dynamic nextRotation;

  /// carousel of shop
  late dynamic carousel;

  /// item shop video
  late dynamic specialOfferVideo;

  /// item shop
  late List<dynamic> shop;

  ShopResponse(dynamic res) {
    result = res["result"];
    fullShop = res["fullShop"];
    lastUpdate = res["lastUpdate"];
    currentRotation = res["currentRotation"];
    nextRotation = res["nextRotation"];
    carousel = res["carousel"];
    specialOfferVideo = res["specialOfferVideo"];
    shop = res["shop"];
  }
}
