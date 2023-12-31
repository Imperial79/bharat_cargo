import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class HistoryUI extends StatefulWidget {
  const HistoryUI({super.key});

  @override
  State<HistoryUI> createState() => _HistoryUIState();
}

class _HistoryUIState extends State<HistoryUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Recent Cargos',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: sdp(context, 13),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: kSvgImage(
              'search',
              color: Color(0xffbcbcbc),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: kSvgImage(
              'filter',
              color: Color(0xffbcbcbc),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
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
              height15,
              Expanded(
                child: TabBarView(
                  children: [
                    _outgoingTab(),
                    _incomingTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _outgoingTab() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return _cargoCard();
      },
    );
  }

  Widget _incomingTab() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return _cargoCard();
      },
    );
  }

  Widget _cargoCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              kSvgImage(
                'from_location',
                color: Colors.grey,
              ),
              width15,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6890 Fair Oaks Blvd',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: sdp(context, 12),
                      ),
                    ),
                    Text(
                      'Carmichael, CA 98990',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: sdp(context, 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          height20,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              kSvgImage(
                'to_location',
                color: kPrimaryColor,
              ),
              width15,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '9890 Old Alubmn Rd',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: sdp(context, 12),
                      ),
                    ),
                    Text(
                      'Carmichael, CA 98990',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: sdp(context, 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade200,
            height: 40,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                ),
              ),
              width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vivek V.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    height5,
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: sdp(context, 10),
                          color: Color(0xfff2ab58),
                        ),
                        width5,
                        Text(
                          '4.6',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'Review',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      width5,
                      Icon(
                        Icons.arrow_forward_ios,
                        size: sdp(context, 10),
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                  height5,
                  Text(
                    '15.02.2023',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
