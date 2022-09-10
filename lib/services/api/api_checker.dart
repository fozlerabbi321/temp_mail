import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/style.dart';

class ApiChecker {
  static void checkApi(http.Response response) {
    if (response.statusCode == 401) {
      final responseJson = jsonDecode(response.body);
      if (responseJson['message'] != null) {
        showCustomSnackBar(responseJson['message']);
      } else {
        showCustomSnackBar(responseJson['error']);
      }
    } else {
      final responseJson = jsonDecode(response.body);
      if (responseJson['message'] != null) {
        showCustomSnackBar(responseJson['message']);
      } else {
        showCustomSnackBar(responseJson['error']);
      }
    }
  }
}