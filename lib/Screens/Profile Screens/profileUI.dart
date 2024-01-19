import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  width10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avishek Verma',
                          style: TextStyle(
                            fontSize: sdp(context, 12),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'avishekverma79@gmail.com',
                          style: TextStyle(
                            fontSize: sdp(context, 10),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height15,
              kTextButton(
                onPressed: () {},
                label: 'Edit Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
