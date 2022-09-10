import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/controller/auth_controller.dart';
import 'package:tm_mail/utils/colors.dart';
import 'package:tm_mail/utils/style.dart';
import '../../../../controller/theme_controller.dart';

class DrawerView extends StatelessWidget {
  final List<Widget> drawerOptions;

  const DrawerView({Key? key, required this.drawerOptions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: kPrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeightBox15,
                  Row(
                    children: [
                      GestureDetector(
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatars3.githubusercontent.com/u/16825392?s=460&v=4'),
                        ),
                        onTap: () => log("test..........log"),
                      ),
                      Expanded(child: Container()),
                      GetBuilder<ThemeController>(builder: (themeController) {
                        return IconButton(
                            onPressed: () {
                              themeController.toggleTheme();
                            },
                            icon: Icon(
                              Icons.dark_mode_outlined,
                              color: themeController.darkTheme
                                  ? kBlackColor2
                                  : kWhiteColor,
                            ));
                      }),
                    ],
                  ),
                  kHeightBox30,
                  Text(
                    "Fozle Rabbi",
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: kWhiteColor,
                        ),
                  ),
                  kHeightBox5,
                  Text(
                    authController.isLoggedIn() ? authController.getUserEmail() : 'user@example.com',
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(children: drawerOptions)
          ],
        ),
      );
    });
  }
}
