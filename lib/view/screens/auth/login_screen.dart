import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/utils/images.dart';
import '../../../controller/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/style.dart';
import '../../shared/widgets/custom_button.dart';
import '../../shared/widgets/input_from_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<AuthController>(
          builder: (authController) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80,),
                    Center(
                      child: SizedBox(
                        height: 45,
                        child: Image.asset(Assets.splashLogo),
                      ),
                    ),

                    kHeightBox40,
                    Center(
                      child: Text(
                        'Sign In With Email & Password'.tr,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 80,),
                    InputFormWidget(
                      fieldController: authController.emailController,
                      hintText: 'Email'.tr,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 18,
                        color:
                        Get.isDarkMode ? kWhiteColor : kBlackColor2,
                      ),
                    ),
                    InputFormWidget(
                      fieldController: authController.passwordController,
                      hintText: 'Password'.tr,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        size: 18,
                        color:
                        Get.isDarkMode ? kWhiteColor : kBlackColor2,
                      ),
                    ),
                    kHeightBox20,
                    CustomButton(
                      height: 45,
                      width: SizeConfig.screenWidth,
                      title: 'Login'.tr,
                      textColor: Colors.white,
                      onPress: () async {
                        authController.userLogin(context);
                      },
                    ),

                    kHeightBox40,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}