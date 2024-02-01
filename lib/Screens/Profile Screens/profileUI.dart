import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/constants.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userDataCard(context),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Manage Profile",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    height20,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _userDataCard(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(15),
      child: SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  NetworkImage('https://source.unsplash.com/random'),
            ),
            width15,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: sdp(context, 12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'example@mail.com',
                    style: TextStyle(
                      fontSize: sdp(context, 10),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            width10,
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                kSvgPath + "edit.svg",
                height: sdp(context, 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
