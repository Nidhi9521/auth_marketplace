import 'package:flutter/material.dart';

import 'market_place_colors.dart';

class MarketPlaceThemes {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: MarketPlaceColors.lightPrimaryColor,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: MarketPlaceColors.lightPrimaryColor,
          onPrimary: MarketPlaceColors.lightOnPrimaryColor,
          secondary: MarketPlaceColors.lightSecondaryColor, // Gradient bg start
          onSecondary: MarketPlaceColors.lightOnSecondaryColor,
          surface: Color(0xffF2F3F5),
          onSurface: Color(0xff8290A0),
          background: MarketPlaceColors.lightConstantColor,
          onBackground: Color(0xff1Aaa27),
          error: Color(0xffD42E20),
          onError: Colors.black,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w800,
          ),
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: MarketPlaceColors.darkPrimaryColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: MarketPlaceColors.darkPrimaryColor,
        onPrimary: MarketPlaceColors.darkOnPrimaryColor,
        secondary: MarketPlaceColors.darkSecondaryColor, // Gradient bg start
        onSecondary: MarketPlaceColors.darkOnSecondaryColor,
        surface: Color(0xffF2F3F5),
        onSurface: Color(0xff8290A0),
        background: MarketPlaceColors.darkConstantColor,
        onBackground: Color(0xFFFFFF8D),
        error: Color(0xffD42E20),
        onError: Colors.white,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 14,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          color: Color(0xff2C3243),
          fontSize: 12.0,
        ),
      ),
    );
  }
}
