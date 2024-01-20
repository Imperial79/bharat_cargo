import 'package:bharat_cargo/Screens/Home/homeUI.dart';
import 'package:bharat_cargo/Screens/Home/newCargoUI.dart';
import 'package:bharat_cargo/Screens/Profile%20Screens/profileUI.dart';
import 'package:bharat_cargo/constants/globals.dart';
import 'package:bharat_cargo/utils/animated-indexed-stack.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/sdp.dart';
import 'historyUI.dart';

ValueNotifier activeTab = new ValueNotifier(0);

class RootUI extends StatefulWidget {
  const RootUI({super.key});

  @override
  State<RootUI> createState() => _RootUIState();
}

class _RootUIState extends State<RootUI> {
  List<Widget> _screens = [
    HomeUI(),
    NewCargoUI(),
    HistoryUI(),
    ProfileUI(),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: activeTab,
      builder: (context, val, child) {
        return Scaffold(
          body: AnimatedIndexedStack(
            index: activeTab.value,
            children: _screens,
          ),
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: showAppbar,
            builder: (context, isShow, child) {
              return SafeArea(
                child: AnimatedContainer(
                  height: isShow ? sdp(context, 50) : 0,
                  duration: Duration(milliseconds: 200),
                  child: Wrap(
                    children: [
                      _bottomBar(),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _bottomBar() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 0,
            color: Colors.grey.shade300,
          ),
          Container(
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
        ],
      ),
    );
  }

  Widget _navIcons({
    required String iconPath,
    required String label,
    required int index,
  }) {
    bool _isSelect = activeTab.value == index;
    return Expanded(
      child: IconButton(
        onPressed: () {
          setState(() {
            activeTab.value = index;
          });
        },
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              _isSelect ? iconPath.replaceAll(".svg", "-filled.svg") : iconPath,
              height: sdp(context, 17),
              colorFilter: kSvgColor(
                _isSelect ? kPrimaryColor : kInactiveColor,
              ),
            ),
            height5,
            Text(
              label,
              style: TextStyle(
                color: _isSelect ? kPrimaryColor : kInactiveColor,
                fontSize: sdp(context, 9),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
