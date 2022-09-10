import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api/api_checker.dart';
import '../services/repository/auth_repo.dart';
import '../utils/style.dart';
import '../view/screens/home/home_screen.dart';
import '../view/shared/shared/custom_loader.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  //init
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Encapsulation
  TextEditingController get emailController=> _emailController;
  TextEditingController get passwordController=> _passwordController;


  Future<void> userLogin(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      showCustomSnackBar('Please enter email');
    } else if (_passwordController.text.isEmpty) {
      showCustomSnackBar('Please enter your password!');
    }else{
      //added progress dialog
      progressDialog(context);
      //add request body
      final body = {
        "address": _emailController.text,
        "password": _passwordController.text
      };
      final response = await authRepo.userLogin(jsonEncode(body));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        String token = body['token'] ?? '';
        String id = body['id'] ?? '';
        //Save SharedPreferences User Data
        await authRepo.saveUserInfoShared(token: token, userId: id, email: _emailController.text);
        //Dialog dismiss
        Get.back();
        //open new class
        Get.offAll(() => HomeScreen());
      } else {
        //Dialog dismiss
        Get.back();
        ApiChecker.checkApi(response);
      }
    }

  }

  //user login check
  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  //clear shared token
  bool clearSharedData() {
    return authRepo.clearSharedData();
  }

  void progressDialog(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomLoader());
  }


}