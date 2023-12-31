import 'package:flutter/material.dart';

ColorFilter kSvgColor(Color color) => ColorFilter.mode(
      color,
      BlendMode.srcIn,
    );

const Color kScaffoldColor = Color(0XFFf5f5ff);
const Color kPrimaryColor = Color(0xFF3E9A41);
const Color kCardColor = Color(0xfff6f6f6);

ThemeData kThemeData() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      useMaterial3: true,
      fontFamily: 'Poppins',
      cardTheme: CardTheme(elevation: 0),
    );
