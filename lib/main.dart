import 'package:bharat_cargo/Screens/Auth%20Screens/loginUI.dart';
import 'package:bharat_cargo/Screens/Auth%20Screens/otpUI.dart';
import 'package:bharat_cargo/Screens/Auth%20Screens/splashUI.dart';
import 'package:bharat_cargo/Screens/Home/homeUI.dart';
import 'package:bharat_cargo/Screens/Home/newCargoUI.dart';
import 'package:bharat_cargo/Screens/Home/recentsUI.dart';
import 'package:bharat_cargo/Screens/Home/rootUI.dart';
import 'package:bharat_cargo/Screens/Profile%20Screens/profileUI.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemColors();

    return MaterialApp.router(
      title: 'Bharat Cargo',
      debugShowCheckedModeBanner: false,
      themeAnimationCurve: Curves.ease,
      themeMode: ThemeMode.system,
      theme: kThemeData(),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'splash',
            builder: (context, state) => SplashUI(),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) => LoginUI(),
          ),
          GoRoute(
            path: '/otp/:phone',
            name: 'otp',
            builder: (context, state) => OtpUI(
              phone: state.pathParameters['phone']!,
            ),
          ),
          GoRoute(
            path: '/root',
            name: 'root',
            builder: (context, state) => RootUI(),
            routes: [
              GoRoute(
                path: 'home',
                name: 'home',
                builder: (context, state) => HomeUI(),
              ),
              GoRoute(
                path: 'newCargo',
                name: 'newCargo',
                builder: (context, state) => NewCargoUI(),
              ),
              GoRoute(
                path: 'recents',
                name: 'recents',
                builder: (context, state) => RecentsUI(),
              ),
              GoRoute(
                path: 'profile',
                name: 'profile',
                builder: (context, state) => ProfileUI(),
              ),
            ],
          ),
        ],
      ),
      // home: SplashUI(),
    );
  }
}
