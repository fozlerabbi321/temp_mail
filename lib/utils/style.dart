import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tm_mail/utils/size_config.dart';
import 'colors.dart';

///start
//SizedBox Height
final kHeightBox5 = SizedBox(height: getProportionateScreenHeight(5));
final kHeightBox8 = SizedBox(height: getProportionateScreenHeight(8));
final kHeightBox10 = SizedBox(height: getProportionateScreenHeight(10));
final kHeightBox15 = SizedBox(height: getProportionateScreenHeight(15));
final kHeightBox20 = SizedBox(height: getProportionateScreenHeight(20));
final kHeightBox25 = SizedBox(height: getProportionateScreenHeight(25));
final kHeightBox30 = SizedBox(height: getProportionateScreenHeight(30));
final kHeightBox40 = SizedBox(height: getProportionateScreenHeight(40));

//SizedBox Width
final kWidthBox5 = SizedBox(width: getProportionateScreenHeight(5));
final kWidthBox10 = SizedBox(width: getProportionateScreenHeight(10));
final kWidthBox15 = SizedBox(width: getProportionateScreenHeight(15));
final kWidthBox20 = SizedBox(width: getProportionateScreenHeight(20));

//Container BoxDecoration
BoxDecoration containerBoxDecoration(
    {required double borderRadius, Color? color, List<BoxShadow>? boxShadow}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: color,
    boxShadow: boxShadow,
  );
}

final kHomeTitle = TextStyle(
  color: kBlackColor2,
  fontWeight: FontWeight.w600,
  fontSize: getProportionateScreenHeight(18),
);

final kHeadLine = TextStyle(
  fontSize: getProportionateScreenHeight(34.0),
  fontWeight: FontWeight.w700,
  height: 1.25,
);
final kHeadLineTest = TextStyle(
  fontSize: getProportionateScreenHeight(34.0),
  fontWeight: FontWeight.w700,
  height: 1.25,
);
final kHeadLine2 = TextStyle(
  fontSize: getProportionateScreenHeight(24.0),
  fontWeight: FontWeight.w600,
  height: 1.25,
);
final kHeadLine3 = TextStyle(
  fontSize: getProportionateScreenHeight(22.0),
  fontWeight: FontWeight.w500,
  height: 1.25,
);
final kAppBarText = TextStyle(
  fontSize: getProportionateScreenHeight(18.0),
  fontWeight: FontWeight.w500,
  height: 1.25,
);
final kRegularText = TextStyle(
  fontSize: getProportionateScreenHeight(16.0),
  fontWeight: FontWeight.w300,
  height: 1.25,
);
final kRegularText2 = TextStyle(
  fontSize: getProportionateScreenHeight(15.0),
  fontWeight: FontWeight.w400,
  height: 1.25,
  color: const Color(0xFF303030),
  fontStyle: FontStyle.normal,
);
final kDescriptionText = TextStyle(
  fontSize: getProportionateScreenHeight(12.0),
  fontWeight: FontWeight.w400,
  height: 1.0,
  color: const Color(0xFF707070),
  fontStyle: FontStyle.normal,
);
final kSmallText = TextStyle(
  fontSize: getProportionateScreenHeight(11.0),
  fontWeight: FontWeight.w400,
  height: 1.25,
);

final kBoldStyle = TextStyle(
  fontSize: getProportionateScreenHeight(16.0),
  fontWeight: FontWeight.bold,
  height: 1.25,
);

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      maxWidth: 1170,
      duration: const Duration(seconds: 3),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(10),
      borderRadius: 5,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}


