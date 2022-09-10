import 'package:tm_mail/services/api/api_client.dart';
import 'package:http/http.dart';
import 'package:tm_mail/utils/constants.dart';
import '../../main.dart';

class AuthRepo {
  final ApiClient apiClient;

  AuthRepo({required this.apiClient});

  //Login user Email and password
  Future<Response> userLogin(dynamic body) async {
    return await apiClient.postData(Constants.kLoginUrl, body: body, headers: headerJsonBody);
  }

  //Save User Info Shared
  Future<void> saveUserInfoShared({
    required String token,
    required String userId,
    required String email,
  }) async {
    try {
      await prefs.setString(Constants.token, token);
      await prefs.setString(Constants.userId, userId);
      await prefs.setString(Constants.userEmail, email);
    } catch (e) {
      rethrow;
    }
  }

  //Is login
  bool isLoggedIn() {
    return prefs.containsKey(Constants.token);
  }
  //Clear Shared data
  bool clearSharedData() {
    prefs.remove(Constants.token);
    return true;
  }
  final Map<String, String> headerJsonBody = {
    "Content-Type": "application/json",
    'Accept': 'application/json',
  };
}
