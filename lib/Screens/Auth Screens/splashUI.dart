import 'package:bharat_cargo/Screens/examplePage.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      Duration(seconds: 0),
      () {
        if (isRedirect.value) Navigate.pushReplacement(context, 'root');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              kSvgImage('splash'),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
    );
  }
}
