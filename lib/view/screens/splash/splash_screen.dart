import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/utils/constants.dart';
import '../../../utils/size_config.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4000,
      ),
    );

    _animation = TextStyleTween(
      begin: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      end: const TextStyle(
        fontSize: 40.0,
        color: Colors.blue,
        fontWeight: FontWeight.w900,
      ),
    ).animate(_animationController);

    _animation.addListener(() {
      setState(() {});
    });

    _animationController.forward();
    Timer(const Duration(seconds: 3), () {
      navigation();
    });
    super.initState();
  }

  void navigation() async {
    Get.offAll(() =>  HomeScreen());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Text(
          Constants.appName,
          style: _animation.value,
        ),
      ),
    );
  }
}
