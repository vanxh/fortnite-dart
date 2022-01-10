/// avatar object
class Avatar {
  /// The account ID for the device auth
  late String accountId;

  /// The avatar ID
  late String avatarId;

  /// Constructor
  Avatar(this.accountId, this.avatarId);

  /// Get the avatar URL
  Map<String, String> get avatarUrls => {
        "smallicon":
            "https://fortnite-api.com/images/cosmetics/br/${(avatarId == "" ? "" : avatarId.split(":")[1].toLowerCase())}/smallicon.png",
        "icon":
            "https://fortnite-api.com/images/cosmetics/br/${(avatarId == "" ? "" : avatarId.split(":")[1].toLowerCase())}/icon.png"
      };

  /// Get the avatar icon URL
  String get icon => avatarUrls["icon"] ?? "";
}
