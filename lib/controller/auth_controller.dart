import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  //init
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //Encapsulation
  TextEditingController get emailController=> _emailController;
  TextEditingController get passwordController=> _passwordController;
}