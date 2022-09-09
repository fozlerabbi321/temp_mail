import 'dart:developer';
import 'package:flutter/foundation.dart' as foundation;
import 'package:http/http.dart' as http;
import 'package:tm_mail/utils/constants.dart';
import '../../main.dart';

class ApiClient {
  final String appBaseUrl;

  ApiClient({
    required this.appBaseUrl,
  });

  String? currentToken = prefs.getString(Constants.token);
  final Map<String, String> _mainHeaders = {
    'Accept': 'application/json',
  };


  Future<http.Response> getData(
    String uri, {
    Map<String, String>? headers,
    int? timeOut,
    String? baseUri,
  }) async {
    if (foundation.kDebugMode) {
      log('====> Http Call: ${baseUri ?? appBaseUrl}$uri\nToken: $currentToken');
    }
    http.Response response = await http
        .get(
          Uri.parse(baseUri ?? appBaseUrl + uri),
          headers: headers ?? _mainHeaders,
        )
        .timeout(Duration(seconds: timeOut ?? Constants.timeoutRequest));
    response = handleResponse(response);
    if (foundation.kDebugMode) {
      log('====> Http Response: [${response.statusCode}] $uri\n${response.body}');
    }
    return response;
  }

  Future<http.Response> postData(
    String uri, {
    dynamic body,
    Map<String, String>? headers,
    int? timeOut,
    String? baseUri,
  }) async {
    if (foundation.kDebugMode) {
      log('====> Http Call: ${baseUri ?? appBaseUrl}$uri\nToken: $currentToken');
    }
    http.Response response = await http
        .post(
          Uri.parse(baseUri ?? appBaseUrl + uri),
          body: body,
          headers: headers ?? _mainHeaders,
        )
        .timeout(Duration(seconds: timeOut ?? Constants.timeoutRequest));
    response = handleResponse(response);
    if (foundation.kDebugMode) {
      log('====> Http Response: [${response.statusCode}] $uri\n${response.body}');
    }
    return response;
  }

  ///Handel request response
  http.Response handleResponse(http.Response response) {
    http.Response data = response;
    return data;
  }
}
