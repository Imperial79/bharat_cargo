import 'package:bharat_cargo/Screens/Auth%20Screens/loginUI.dart';
import 'package:bharat_cargo/Screens/Home/rootUI.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';
import '../../utils/constants.dart';
import '../../utils/sdp.dart';

class RegisterUI extends StatefulWidget {
  const RegisterUI({super.key});

  @override
  State<RegisterUI> createState() => _RegisterUIState();
}

class _RegisterUIState extends State<RegisterUI> {
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
                    'Hi there,',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sdp(context, 17),
                    ),
                  ),
                  Text(
                    'Register as a new user',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: sdp(context, 10),
                    ),
                  ),
                  height20,
                  Expanded(
                    child: Center(
                      child: kSvgImage(
                        'register',
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
                  ),
                  height10,
                  kTextField(
                    context,
                    labelText: 'Password',
                    obscureText: true,
                    maxLength: 6,
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.phone,
                  ),
                  height20,
                  SubmitButton.regular(
                    context,
                    onPressed: () {
                      navPush(context, RootUI());
                    },
                    label: 'Proceed',
                  ),
                  height50,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Already on Bharat Cargo?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        width10,
                        InkWell(
                          onTap: () {
                            navPushReplacement(context, LoginUI());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
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
