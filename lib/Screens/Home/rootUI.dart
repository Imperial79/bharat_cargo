import 'package:bharat_cargo/Screens/Home/homeUI.dart';
import 'package:bharat_cargo/Screens/Home/newCargoUI.dart';
import 'package:bharat_cargo/utils/animated-indexed-stack.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/sdp.dart';
import 'historyUI.dart';

class RootUI extends StatefulWidget {
  const RootUI({super.key});

  @override
  State<RootUI> createState() => _RootUIState();
}

class _RootUIState extends State<RootUI> {
  int _activeTab = 0;
  List<Widget> _screens = [
    HomeUI(),
    NewCargoUI(),
    HistoryUI(),
    HistoryUI(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIndexedStack(index: _activeTab, children: _screens),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return SafeArea(
      child: Container(
        height: sdp(context, 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            _navIcons(
              index: 0,
              iconPath: 'assets/icons/home.svg',
              label: 'Home',
            ),
            _navIcons(
              index: 1,
              iconPath: 'assets/icons/new.svg',
              label: 'New Cargo',
            ),
            _navIcons(
              index: 2,
              iconPath: 'assets/icons/history.svg',
              label: 'Recents',
            ),
            _navIcons(
              index: 3,
              iconPath: 'assets/icons/profile.svg',
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _navIcons({
    required String iconPath,
    required String label,
    required int index,
  }) {
    bool _isSelect = _activeTab == index;
    return Expanded(
      child: IconButton(
        onPressed: () {
          setState(() {
            _activeTab = index;
          });
        },
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _isSelect ? iconPath.replaceAll(".svg", "-filled.svg") : iconPath,
              height: sdp(context, 17),
              colorFilter: kSvgColor(
                _activeTab == index ? kPrimaryColor : Color(0xffb8b8b8),
              ),
            ),
            height5,
            Text(
              label,
              style: TextStyle(
                color: _activeTab == index ? kPrimaryColor : Color(0xffb8b8b8),
                fontSize: sdp(context, 9),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
