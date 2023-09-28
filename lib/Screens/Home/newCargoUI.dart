import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/sdp.dart';

class NewCargoUI extends StatefulWidget {
  const NewCargoUI({super.key});

  @override
  State<NewCargoUI> createState() => _NewCargoUIState();
}

class _NewCargoUIState extends State<NewCargoUI> {
  String _selectedMode = "Scooter";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'New Cargo',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: sdp(context, 13),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                _deliveryModeTile(
                  imgPath: 'assets/images/scooter.png',
                  label: 'Scooter',
                  subLabel: 'Upto 45 lbs',
                ),
                width10,
                _deliveryModeTile(
                  imgPath: 'assets/images/truck.png',
                  label: 'Van',
                  subLabel: 'Upto 700 lbs',
                ),
              ],
            ),
            height20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/from_location.svg',
                      colorFilter: kSvgColor(Colors.grey),
                    ),
                    height10,
                    Container(
                      height: sdp(context, 100),
                      width: 2.5,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                width10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // height20,
                      kTextField(
                        context,
                        labelText: 'Full Name',
                      ),
                      kTextField(
                        context,
                        labelText: 'Phone',
                      ),
                      kTextField(
                        context,
                        labelText: 'Delivery Comments (Optional)',
                      ),
                      kTextField(
                        context,
                        labelText: 'City, Street, house',
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: kTextField(
                              context,
                              labelText: 'Floor',
                            ),
                          ),
                          width10,
                          Flexible(
                            child: kTextField(
                              context,
                              labelText: 'House No.',
                            ),
                          ),
                        ],
                      ),
                      height10,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.map),
                            width10,
                            Text(
                              'Add address',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _deliveryModeTile({
    required String imgPath,
    required String label,
    required String subLabel,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedMode = label;
          });
        },
        child: Container(
          height: sdp(context, 100),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:
                _selectedMode == label ? Color(0xfff6f6f6) : Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              FittedBox(
                child: Column(
                  children: [
                    Image.asset(
                      imgPath,
                      height: sdp(context, 40),
                    ),
                    height10,
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              _selectedMode == label
                  ? SizedBox()
                  : Container(
                      color: Colors.white.withOpacity(0.5),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
