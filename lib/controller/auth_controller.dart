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


  //login request
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
        //show success dialog
        showCustomSnackBar('Login Successful!'.tr, isError:  false);
      } else {
        //Dialog dismiss
        Get.back();
        ApiChecker.checkApi(response);
      }
    }

  }

  //create account request
  Future<void> createAccount(BuildContext context) async {
    if (_emailController.text.isEmpty) {
      showCustomSnackBar('Please enter email');
    } else if (_passwordController.text.isEmpty) {
      showCustomSnackBar('Please enter your password!');
    }else{
      Get.back();
      //added progress dialog
      progressDialog(context);
      //add request body
      final body = {
        "address": _emailController.text,
        "password": _passwordController.text
      };
      final response = await authRepo.createAccount(jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        //clear text filed
        _emailController.clear();
        _passwordController.clear();
        //Dialog dismiss
        Get.back();
        //show success dialog
        showCustomSnackBar('Account Create Successfully!'.tr, isError:  false);

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
  String getUserEmail() {
    return authRepo.getUserEmail();
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