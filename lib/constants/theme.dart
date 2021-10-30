import 'package:characters_api/constants/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: primaryColor,
    iconTheme: const IconThemeData(color: primaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(
        color: primaryColor,
        fontSize: 18,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: whiteColor,
          overflow: TextOverflow.ellipsis),
      bodyText2: TextStyle(
        fontSize: 20,
        color: blackColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(fontSize: 18, color: blackColor, letterSpacing: 2),
      subtitle2: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.w500,
        fontSize: 26,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    canvasColor: grayColor,
    iconTheme: const IconThemeData(color: grayColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDarkColor,
      titleTextStyle: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 18,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodyText2: TextStyle(
        fontSize: 20,
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(fontSize: 18, color: whiteColor, letterSpacing: 2),
      subtitle2: TextStyle(color: whiteColor, fontWeight: FontWeight.w500, fontSize: 26),
    ),
  );
}
