import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'colorsapp.dart';

const primaryColor = Color(0xffF5FAFF);
const primaryDarkColor = Color(0xff242527);
const secondaryColor = Color(0xff51eec2);
const textButtincolor = Colors.amber;
const textColor = Color(0xff000000);
const textDarkColor = Color(0xffFFFFFF);
const textBodyColor = Color(0xffFFFFFF);
const textBodyDarkColor = Color(0xffFFFFFF);
const textFormFieldDarkColor = Color(0xff333333);
const textFormFieldColor = Color(0xffFFFFFF);
const iconColor = Color(0xff000000);
const iconDarkColor = Color(0xffFFFFFF);
const cardDarkColor = Color(0xff333333);
Color shimmerColor = Colors.grey[100]!;
Color shimmerDarkColor = const Color.fromARGB(255, 62, 62, 62);
const schemePrimaryDarkColor = kColorMain;
const schemePrimaryColor = kColorMain;
const selectionHandleColor = kColorMain;
const selectionHandleDarkColor = kColorMain;

ThemeData getDarkThem(BuildContext context) {
  return ThemeData(
    fontFamily: "REM",
    cardColor: cardDarkColor,
    scaffoldBackgroundColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDarkColor,
      centerTitle: true,
    ),
    brightness: Brightness.dark,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: selectionHandleDarkColor,
      cursorColor: selectionHandleDarkColor,
      selectionHandleColor: selectionHandleDarkColor,
    ),
    primaryColor: primaryDarkColor,
    colorScheme: ColorScheme.dark(
      primary: schemePrimaryDarkColor,
      surfaceTint: Colors.white,
      secondary: shimmerDarkColor,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    textTheme: const TextTheme(
        labelMedium: TextStyle(color: textDarkColor),
        headlineMedium: TextStyle(color: textBodyDarkColor)),
    iconTheme: const IconThemeData(color: iconDarkColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: textFormFieldDarkColor,
      floatingLabelStyle: const TextStyle(color: primaryColor),
      iconColor: secondaryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

ThemeData getLightThem(BuildContext context) {
  return ThemeData(
    fontFamily: "REM",
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
    ),
    brightness: Brightness.light,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: selectionHandleColor,
      cursorColor: selectionHandleColor,
      selectionHandleColor: selectionHandleColor,
    ),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: schemePrimaryColor,
      surfaceTint: Colors.black,
      secondary: shimmerColor,
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
    iconTheme: const IconThemeData(color: iconColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: textFormFieldColor,
      floatingLabelStyle: const TextStyle(color: primaryColor),
      iconColor: secondaryColor,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
