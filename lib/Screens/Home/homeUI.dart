import 'package:bharat_cargo/Screens/Home/rootUI.dart';
import 'package:bharat_cargo/services/apiConfig.dart';
import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/constants.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants/globals.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedCarouselImage = 0;

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
        automaticallyImplyLeading: false,
        title: Text(
          'Bharat Cargo',
          style: TextStyle(
            fontSize: sdp(context, 15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height10,
            _quickBtns(),
            height20,
            _carousel(),
            height10,
            _carouselIndicator(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height20,
                  Text(
                    'Recents',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2,
                    ),
                  ),
                  height20,
                  ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _recentsTile();
                    },
                  ),
                ],
              ),
            ),
            kHeight(
              sdp(context, 50),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickBtns() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _homeMenu(
            onTap: () {},
            imgName: 'book-cargo',
            label: 'Book Cargo',
          ),
          _homeMenu(
            onTap: () {
              setState(() {
                activeTab.value = 2;
              });
            },
            imgName: 'book-cargo',
            label: 'History',
          ),
          _homeMenu(
            onTap: () {},
            imgName: 'rewards',
            label: 'Rewards',
          ),
        ],
      ),
    );
  }

  CarouselSlider _carousel() {
    return CarouselSlider(
      items: List.generate(
        2,
        (index) => _carouselCard(index),
      ),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 7,
        enlargeCenterPage: true,
        enlargeFactor: .2,
        viewportFraction: 0.8,
        onPageChanged: (index, reason) {
          setState(() => _selectedCarouselImage = index);
        },
      ),
    );
  }

  Widget _recentsTile() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: kRadius(10),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sub-total',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: sdp(context, 8),
                      ),
                    ),
                    Text(
                      '₹ 2000',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: sdp(context, 12),
                      ),
                    ),
                  ],
                ),
              ),
              kPill(
                context,
                label: 'Completed',
              ),
            ],
          ),
          height10,
          Row(
            children: [
              kSvgIcon(
                'from_location',
                height: sdp(context, 12),
                color: Colors.grey,
              ),
              width10,
              Expanded(
                child: Text(
                  'From location',
                  style: TextStyle(
                    fontSize: sdp(context, 10),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          height5,
          Row(
            children: [
              kSvgIcon(
                'to_location',
                height: sdp(context, 12),
                color: kPrimaryColor,
              ),
              width10,
              Expanded(
                child: Text(
                  'To location',
                  style: TextStyle(
                    fontSize: sdp(context, 10),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Center _carouselIndicator() {
    return Center(
      child: SizedBox(
        height: 10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            2,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              duration: const Duration(milliseconds: 200),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              height: _selectedCarouselImage == index ? 10 : 5,
              width: _selectedCarouselImage == index ? 10 : 5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeMenu({
    void Function()? onTap,
    required String imgName,
    required String label,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          // height: sdp(context, 90),
          width: sdp(context, 90),
          child: Card(
            color: Colors.grey.shade100,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  kAssetImage(
                    imgName,
                    height: sdp(context, 30),
                  ),
                  height10,
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _carouselCard(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kRadius(15),
        image: DecorationImage(
          image: NetworkImage('https://etimg.etb2bimg.com/photo/89684729.cms'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
