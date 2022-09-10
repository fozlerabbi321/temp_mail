import 'package:tm_mail/services/api/api_client.dart';
import 'package:http/http.dart';
import 'package:tm_mail/utils/constants.dart';

class DomainRep {
  final ApiClient apiClient;

  DomainRep({required this.apiClient});

  //fetch domain list form server
  Future<Response> fetchDomain(int page) async {
    String url = '${Constants.kDomainListUrl}?page=$page';
    return await apiClient.getData(url, headers: header);
  }
  final Map<String, String> header = {
    'Accept': 'application/ld+json',
  };
}
