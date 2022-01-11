/// exception on invalid account details
class InvalidAccountException {
  String accountId;
  String message;

  InvalidAccountException({required this.accountId, required this.message});
}
