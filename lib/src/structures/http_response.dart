class HttpResponse {
  late bool success;
  late dynamic data;
  late String error;

  HttpResponse({required this.success, this.data, this.error = ""});
}
