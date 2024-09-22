class ApiUrl {
  static const Duration receiveTimeout = Duration(seconds: 5000);
  static const Duration connectionTimeout = Duration(seconds: 5000);
  static const Duration sendTimeout = Duration(seconds: 5000);

  static const String stagingBaseUrl = "http://172.105.252.96:3000/";

  static const String register = "${stagingBaseUrl}user/register";

}
