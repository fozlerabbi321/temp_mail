import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

ThemeData dark = ThemeData(
  fontFamily: GoogleFonts.roboto().fontFamily,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: kWhiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    backgroundColor: kAppBarDarkColor,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: kWhiteColor,
    ),
    actionsIconTheme: IconThemeData(
      color: kBlackColor2,
    ),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kAppBarDarkColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: kWhiteColor,
      systemNavigationBarDividerColor: kWhiteColor,
    ),
  ),
  primaryColor: kPrimaryColor,
  secondaryHeaderColor: kSecondaryColor,
  disabledColor: kDisableDarkColor,
  backgroundColor: kBgDarkColor,
  scaffoldBackgroundColor: kBgDarkColor,
  errorColor: kErrorColor,
  brightness: Brightness.dark,
  hintColor: kHintDarkColor,
  cardColor: kCardDarkColor,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kCursorDarkColor,
  ),
  colorScheme: const ColorScheme.dark(
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
      color: kWhiteColor,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: kWhiteColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      color: kWhiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: kWhiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      color: kWhiteColor,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: kWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: kWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: kWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.25,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: kWhiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
    bodyText2: TextStyle(
      color: kStUnderLineColor,
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 1.0,
      fontStyle: FontStyle.normal,
    ),
  ),
);