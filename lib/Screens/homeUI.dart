import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Bharat Cargo',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: sdp(context, 13),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: kSvgColor(
                Color(0xffbcbcbc),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              colorFilter: kSvgColor(
                Color(0xffbcbcbc),
              ),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xfff6f6f6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            color: kPrimaryColor,
                          ),
                          width10,
                          Expanded(
                            child: Text(
                              '\$2099',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffbfbfbf),
                            size: sdp(context, 11),
                          ),
                        ],
                      ),
                    ),
                    height20,
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TabBar(
                        indicatorColor: Colors.white,
                        dividerColor: Colors.white.withOpacity(0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.white,
                        indicator: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: [
                          Tab(
                            child: Text('Outgoing'),
                          ),
                          Tab(
                            child: Text('Incoming'),
                          ),
                        ],
                      ),
                    ),
                    height20,
                    _cargoCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cargoCard() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs.2500',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                'No. F10019',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w600,
                ),
              ),
              width5,
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.more_vert,
                  size: sdp(context, 12),
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          height10,
          kPill(
            context,
            label: 'Completed',
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 40,
          ),
          Text('data')
        ],
      ),
    );
  }
}
