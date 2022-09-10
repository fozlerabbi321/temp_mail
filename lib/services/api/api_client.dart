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
/*  final Map<String, String> _mainHeaders = {
    'Cache-Control': 'no-cache',
  };*/

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

  //{"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2NjI3NDYxODYsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6Im9pYnJ3ZGF5eGxvZWNqQGVtZXJnZW50dmlsbGFnZS5vcmciLCJpZCI6IjYzMWEyNTU4MWM1OGZmYWM0YzBmOTFiMyIsIm1lcmN1cmUiOnsic3Vic2NyaWJlIjpbIi9hY2NvdW50cy82MzFhMjU1ODFjNThmZmFjNGMwZjkxYjMiXX19.pSS4tIx1Yk1mitdouBY03qZUe3_JAtC49z0NXmDBIU2Qu6gWde6mnuOjHI-VIxcMHC4l6rXXWgduyrJk8bwd5w","id":"631a25581c58ffac4c0f91b3"}
}
