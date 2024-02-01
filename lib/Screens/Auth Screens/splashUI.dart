import 'package:bharat_cargo/Screens/Auth%20Screens/loginUI.dart';
import 'package:bharat_cargo/Screens/Home/rootUI.dart';
import 'package:bharat_cargo/main.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI> {
  @override
  void initState() {
    super.initState();
    func();
  }

  func() async {
    await Future.delayed(
      Duration(seconds: 2),
      () {
        navPushReplacement(context, RootUI());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Splash Screen'),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
