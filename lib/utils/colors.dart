import 'package:flutter/material.dart';

ColorFilter kSvgColor(Color color) => ColorFilter.mode(
      color,
      BlendMode.srcIn,
    );

const Color kScaffoldColor = Color(0XFFf5f5ff);
const Color kPrimaryColor = Color(0xFF3E9A41);
const Color kCardColor = Color(0xfff6f6f6);
const Color kInactiveColor = Color(0xffb8b8b8);
const Color kCompleteColor = Color(0xff5a74b6);

ThemeData kThemeData() => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      useMaterial3: true,
      fontFamily: 'Poppins',
      cardTheme: CardTheme(elevation: 0),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
        ),
      ),
    );
