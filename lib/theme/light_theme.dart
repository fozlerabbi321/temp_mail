import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

ThemeData light = ThemeData(
  fontFamily: GoogleFonts.roboto().fontFamily,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: kBlackColor2,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    backgroundColor: kAppBarColor,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: kBlackColor2,
    ),
    actionsIconTheme: IconThemeData(
      color: kBlackColor2,
    ),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kAppBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: kBlackColor2,
      systemNavigationBarDividerColor: kBlackColor2,
    ),
  ),
  primaryColor: kPrimaryColor,
  secondaryHeaderColor: kSecondaryColor,
  disabledColor: kDisableColor,
  backgroundColor: kBgColor,
  scaffoldBackgroundColor: kBgColor,
  errorColor: kErrorColor,
  brightness: Brightness.light,
  hintColor: kHintColor,
  cardColor: kWhiteColor,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kCursorColor,
  ),
  colorScheme: const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: kPrimaryColor,
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: kBlackColor2,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: kBlackColor2,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      color: kBlackColor2,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: kBlackColor2,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      color: kBlackColor2,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: kBlackColor2,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: kBlackColor2,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: kBlackColor2,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: kBlackColor2,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: TextStyle(
      color: kStUnderLineColor2,
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
  ),
);