import 'package:tm_mail/services/api/api_client.dart';
import 'package:http/http.dart';
import 'package:tm_mail/utils/constants.dart';

import '../../main.dart';

class InboxRepo {
  final ApiClient apiClient;

  InboxRepo({required this.apiClient});

  //fetch domain list form server
  Future<Response> fetchMessageList(int page) async {
    String url = '${Constants.kMessageListUrl}?page=$page';
    return await apiClient.getData(url, headers: currentUserHeader);
  }
  //current user header
  final Map<String, String> currentUserHeader = {
    'Accept': 'application/ld+json',
    'Authorization': 'Bearer ${prefs.getString(Constants.token) ?? ''}',
  };
}
