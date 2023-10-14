import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/constants.dart';
import 'package:bharat_cargo/utils/customSliverAppbar.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            isMainView: true,
            title: Text(
              'Bharat Cargo',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: sdp(context, 13),
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: kSvgImage(
                  'notification',
                  height: sdp(context, 20),
                ),
              ),
              width10,
              CircleAvatar(
                radius: 16,
              ),
              width10,
            ],
          ),
          SliverList.list(
            children: [],
          ),
        ],
      ),
    );
  }

  Widget _homeMenu() {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
