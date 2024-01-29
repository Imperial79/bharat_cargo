import 'package:bharat_cargo/constants/globals.dart';
import 'package:bharat_cargo/services/apiConfig.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../utils/constants.dart';

class RecentsUI extends StatefulWidget {
  const RecentsUI({super.key});

  @override
  State<RecentsUI> createState() => _RecentsUIState();
}

class _RecentsUIState extends State<RecentsUI> {
  final _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward ||
        _scrollController.position.atEdge) {
      showAppbar.value = true;
    } else {
      showAppbar.value = false;
    }
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      showAppbar.value = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
    _scrollController.dispose();
  }

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
            icon: kSvgIcon(
              'search',
              color: Color(0xffbcbcbc),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: kSvgIcon(
              'filter',
              color: Color(0xffbcbcbc),
            ),
          ),
        ],
      ),
      body: kTabbar(
        context,
        tabs: [
          Tab(
            child: Text('Outgoing'),
          ),
          Tab(
            child: Text('Incoming'),
          ),
        ],
        views: [
          _outgoingTab(),
          _incomingTab(),
        ],
      ),
    );
  }

  Widget _outgoingTab() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      padding: EdgeInsets.only(bottom: sdp(context, 50)),
      controller: _scrollController,
      itemBuilder: (context, index) {
        return _cargoCard();
      },
    );
  }

  Widget _incomingTab() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      padding: EdgeInsets.only(bottom: sdp(context, 50)),
      controller: _scrollController,
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
              kSvgIcon(
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
              kSvgIcon(
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
