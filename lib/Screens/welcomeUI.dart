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
              MaterialButton(
                onPressed: () {
                  navPush(context, LoginUI());
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                highlightElevation: 0,
                color: kPrimaryColor,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white, fontSize: sdp(context, 12)),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
