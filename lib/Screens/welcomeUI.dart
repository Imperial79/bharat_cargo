import 'package:bharat_cargo/Screens/loginUI.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeUI extends StatefulWidget {
  const WelcomeUI({super.key});

  @override
  State<WelcomeUI> createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(child: SvgPicture.asset('assets/images/delivery.svg')),
              height20,
              Text(
                'Urgent Delivery?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: sdp(context, 20),
                ),
              ),
              height10,
              Text(
                'Don\'t panic, we got you covered',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: sdp(context, 12),
                ),
              ),
              height15,
              SubmitButton.icon(
                context,
                onPressed: () {
                  navPush(context, LoginUI());
                },
                label: 'Get Started',
              )
            ],
          ),
        ),
      ),
    );
  }
}
