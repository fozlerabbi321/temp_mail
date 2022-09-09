import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../main.dart';
import '../utils/constants.dart';

class ThemeController extends GetxController {
  ThemeController() {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    prefs.setBool(Constants.theme, _darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    log('is Dark ${Get.isDarkMode} ${ThemeData.dark()} mode $isDarkMode');
    _darkTheme = prefs.getBool(Constants.theme) ?? isDarkMode ? true : false;
    log(_darkTheme.toString());
    update();
  }

  void updateTheme(bool isDark) {
    _darkTheme = isDark;
    prefs.setBool(Constants.theme, isDark);
    update();
  }
}
