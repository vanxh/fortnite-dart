/// http library response object
class HttpResponse {
  /// The success status of the response.
  late bool success;

  /// The data for response.
  late dynamic data;

  /// If the request failed what is the error.
  late dynamic error;

  HttpResponse({required this.success, this.data, this.error});
}
