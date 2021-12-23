class ShopResponse {
  late bool result = false;
  late bool fullShop = false;
  late dynamic lastUpdate;
  late dynamic currentRotation;
  late dynamic nextRotation;
  late dynamic carousel;
  late dynamic specialOfferVideo;
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
