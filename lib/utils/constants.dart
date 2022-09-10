
class Constants{
  //app name
  static const String appName = "Temp Mail";
  //Api base url
  static const String baseUrl = 'https://api.mail.tm';
  /// Api end point start
  static const String kLoginUrl = '/token';
  static const String kDomainListUrl = '/domains';
  static const String kCreateAccountUrl = '/accounts';
  static const String kMessageListUrl = '/messages';
  /// Api end point end
  static const String kImageDir = 'assets/images/';
  static const String kFlagDir = 'assets/flags/';
  //api request time out
  static const int timeoutRequest = 60;

  //Shared key
  static const String theme = 'theme';
  static const String token = 'token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';

}