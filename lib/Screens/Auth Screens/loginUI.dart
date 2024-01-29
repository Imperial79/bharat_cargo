import 'package:bharat_cargo/Screens/Auth%20Screens/otpUI.dart';
import 'package:bharat_cargo/Screens/Auth%20Screens/registerUI.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';
import '../../utils/components.dart';
import '../../utils/constants.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(19.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back,',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sdp(context, 17),
                    ),
                  ),
                  Text(
                    'Login to continue',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: sdp(context, 10),
                    ),
                  ),
                  height20,
                  Expanded(
                    child: Center(
                      child: kSvgImage(
                        'login',
                        height: sdp(context, 200),
                      ),
                    ),
                  ),
                  height20,
                  kTextField(
                    context,
                    prefixText: '+91 ',
                    labelText: 'Phone Number',
                    maxLength: 10,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.phone,
                    controller: phone,
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  height20,
                  SubmitButton.regular(
                    context,
                    onPressed: phone.text.length == 10
                        ? () {
                            navPush(context, OtpUI(phone: phone.text));
                          }
                        : null,
                    label: 'Send OTP',
                  ),
                  height50,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Not on Bharat Cargo?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        width10,
                        InkWell(
                          onTap: () {
                            navPushReplacement(context, RegisterUI());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -90,
            left: -90,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: kPrimaryColor.withOpacity(0.2),
            ),
          ),
          Positioned(
            top: -60,
            right: -60,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey.shade100,
            ),
          ),
        ],
      ),
    );
  }
}
