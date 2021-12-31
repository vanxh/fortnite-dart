/// account external auth connection object
class ExternalAuth {
  /// account id of the external auth
  late String accountId;

  /// type of external auth connection
  late String type;

  /// external auth id
  late String externalAuthId;

  /// external auth id type
  late String externalAuthIdType;

  /// display name of external auth
  late String externalDisplayName;

  /// date when external auth was created
  late String dateAdded;

  /// region data of external auth
  late String regionInfo;

  /// external auth object
  ExternalAuth({
    required this.accountId,
    required this.type,
    required this.externalAuthId,
    required this.externalAuthIdType,
    required this.externalDisplayName,
    required this.dateAdded,
    required this.regionInfo,
  });
}
