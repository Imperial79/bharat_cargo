import 'package:bharat_cargo/Screens/Auth%20Screens/welcomeUI.dart';
import 'package:bharat_cargo/Screens/Home/rootUI.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemColors();
    return MaterialApp(
      title: 'Bharat Cargo',
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.ease,
      themeMode: ThemeMode.system,
      theme: kThemeData(),
      home: const WelcomeUI(),
    );
  }
}
