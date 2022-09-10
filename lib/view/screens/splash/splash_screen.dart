import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tm_mail/utils/constants.dart';

import '../../../main.dart';
import '../../../utils/images.dart';
import '../../../utils/size_config.dart';
import '../auth/login_screen.dart';
import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  final box = GetStorage();

  @override
  void initState() {
    SharedPreferences.getInstance().then((pr) {
      prefs = pr;
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animation.addListener(() => setState(() {}));
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {
      navigation();
    });
    super.initState();
  }

  void navigation() async {
    if(prefs.containsKey(Constants.token)){
      Get.offAll(() =>  HomeScreen());
    }else{
     Get.offAll(() => const LoginScreen());

    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation as Animation<double>,
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              Assets.splashLogo,
              width: _animation.value * getProportionateScreenWidth(200),
              height: _animation.value * getProportionateScreenWidth(200),
            ),
          ),
        ),
      ),
    );
  }
}
