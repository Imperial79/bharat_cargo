import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:bharat_cargo/utils/constants.dart';
import 'package:bharat_cargo/utils/customSliverAppbar.dart';
import 'package:bharat_cargo/utils/sdp.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedCarouselImage = 0;
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
            children: [
              height10,
              CarouselSlider(
                items: List.generate(
                  2,
                  (index) => _carouselCard(index),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 7,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() => _selectedCarouselImage = index);
                  },
                ),
              ),
              height10,
              _carouselIndicator(),
              height20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _homeMenu(
                          onTap: () {},
                          imgName: 'book-cargo',
                          label: 'Book Cargo',
                        ),
                        _homeMenu(
                          onTap: () {},
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
                    height20,
                    Text(
                      'Recents',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
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
            ],
          ),
        ],
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
              kSvgImage(
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
              kSvgImage(
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
          height: sdp(context, 90),
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
