/// Epic account info of an epic account.
class EpicAccountInfo {
  /// The account ID.
  String id;

  /// The account name.
  String displayName;

  /// First name of the account.
  String name;

  /// Last name of the account.
  String lastName;

  /// The account email.
  String email;

  /// Is the email verified?
  bool emailVerified;

  /// The account phone number.
  String phoneNumber;

  /// Age group of account
  String ageGroup;

  /// is the account headless.
  /// if an account is headless it dont have a display name.
  bool headless;

  /// Can the account update display name?
  bool canUpdateDisplayName;

  /// Number of display name changes
  int numberOfDisplayNameChanges;

  /// Last time display name changed on
  String lastDisplayNameChange;

  /// Country of account.
  String country;

  /// Preferred language
  String preferredLanguage;

  /// Failed login attempts
  int failedLoginAttempts;

  /// Last login
  String lastLogin;

  /// Is account 2fa enabled?
  bool tfaEnabled;

  /// links of account.
  Map<String, dynamic> links;

  /// Epic account info constructor.
  EpicAccountInfo({
    required this.id,
    required this.displayName,
    required this.name,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.phoneNumber,
    required this.ageGroup,
    required this.headless,
    required this.canUpdateDisplayName,
    required this.numberOfDisplayNameChanges,
    required this.lastDisplayNameChange,
    required this.country,
    required this.preferredLanguage,
    required this.failedLoginAttempts,
    required this.lastLogin,
    required this.tfaEnabled,
    required this.links,
  });

  /// Epic account info from JSON.
  factory EpicAccountInfo.fromJson(Map<String, dynamic> json) =>
      EpicAccountInfo(
        id: json["id"],
        displayName: json["displayName"] == null
            ? json["id"]
            : json["displayName"] is String
                ? json["displayName"]
                : json["id"],
        name: json["name"] is String ? json["name"] : "",
        lastName: json["lastName"] is String ? json["lastName"] : "",
        email: json["email"] is String ? json["email"] : "",
        emailVerified:
            json["emailVerified"] is bool ? json["emailVerified"] : false,
        phoneNumber: json["phoneNumber"] is String ? json["phoneNumber"] : "",
        ageGroup: json["ageGroup"] is String ? json["ageGroup"] : "",
        headless: json["headless"] is bool ? json["headless"] : false,
        canUpdateDisplayName: json["canUpdateDisplayName"] is bool
            ? json["canUpdateDisplayName"]
            : false,
        numberOfDisplayNameChanges: json["numberOfDisplayNameChanges"] is int
            ? json["numberOfDisplayNameChanges"]
            : 0,
        lastDisplayNameChange: json["lastDisplayNameChange"] is String
            ? json["lastDisplayNameChange"]
            : DateTime.now().toString(),
        country: json["country"] is String ? json["country"] : "",
        preferredLanguage: json["preferredLanguage"] is String
            ? json["preferredLanguage"]
            : "",
        failedLoginAttempts: json["failedLoginAttempts"] is int
            ? json["failedLoginAttempts"]
            : 0,
        lastLogin: json["lastLogin"] is String
            ? json["lastLogin"]
            : DateTime.now().toString(),
        tfaEnabled: json["tfaEnabled"] is bool ? json["tfaEnabled"] : false,
        links: json["links"] is Map<String, dynamic> ? json["links"] : {},
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "name": name,
        "lastName": lastName,
        "email": email,
        "emailVerified": emailVerified,
        "phoneNumber": phoneNumber,
        "ageGroup": ageGroup,
        "headless": headless,
        "canUpdateDisplayName": canUpdateDisplayName,
        "numberOfDisplayNameChanges": numberOfDisplayNameChanges,
        "lastDisplayNameChange": lastDisplayNameChange,
        "country": country,
        "preferredLanguage": preferredLanguage,
        "failedLoginAttempts": failedLoginAttempts,
        "lastLogin": lastLogin,
        "tfaEnabled": tfaEnabled,
        "links": links,
      };
}
