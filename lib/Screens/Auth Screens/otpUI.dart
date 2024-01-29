import 'dart:async';

import 'package:bharat_cargo/Screens/Auth%20Screens/registerUI.dart';
import 'package:bharat_cargo/services/apiConfig.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/components.dart';
import '../../utils/constants.dart';
import '../../utils/sdp.dart';

class OtpUI extends StatefulWidget {
  final String phone;
  const OtpUI({super.key, required this.phone});

  @override
  State<OtpUI> createState() => _OtpUIState();
}

class _OtpUIState extends State<OtpUI> {
  final otp = TextEditingController();
  bool _showTimer = false;
  int counter = 30;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _sendOtp();
  }

  Future<void> _sendOtp() async {
    try {
      final dataResult = await apiCallBack(
        '/sms-service/send-otp.php',
        body: {
          'phone': widget.phone,
        },
      );
      print(dataResult);
      if (!dataResult['error']) {
        kShowSnackBar(context, content: dataResult['message']);
        _startCountdown();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _validateOtp() async {
    print(otp.text);
    try {
      final dataResult =
          await apiCallBack('/sms-service/validate-otp.php', body: {
        'phone': widget.phone,
        'otp': otp.text,
      });
      print(dataResult);
      if (!dataResult['error']) {
        kShowSnackBar(context, content: dataResult['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  void _startCountdown() {
    setState(() {
      _showTimer = true;
    });
    counter = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (counter > 0) {
        if (mounted) {
          setState(() {
            counter--;
          });
        }
      } else {
        timer.cancel();
        if (mounted) {
          setState(() {
            counter = 0;
            _showTimer = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

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
                    'Enter OTP,',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: sdp(context, 17),
                    ),
                  ),
                  Text(
                    'recieved by SMS',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: sdp(context, 10),
                    ),
                  ),
                  height20,
                  Expanded(
                    child: Center(
                      child: kSvgImage(
                        'otp',
                        height: sdp(context, 200),
                      ),
                    ),
                  ),
                  height20,
                  TextField(
                    controller: otp,
                    maxLength: 5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorOpacityAnimates: true,
                    autofocus: true,
                    style: TextStyle(
                      letterSpacing: 10,
                      fontWeight: FontWeight.w600,
                      fontSize: sdp(context, 20),
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: 'Enter 4-Digit OTP',
                      hintStyle: TextStyle(
                        letterSpacing: 0,
                        color: Colors.grey.shade400,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  height20,
                  SubmitButton.regular(
                    context,
                    onPressed: () {
                      _validateOtp();
                    },
                    label: 'Proceed',
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: _showTimer
                        ? Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Resend OTP in $counter secs',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500,
                                fontSize: sdp(context, 11),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              otp.clear();
                              _sendOtp();
                            },
                            child: Text('Resend OTP'),
                          ),
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
