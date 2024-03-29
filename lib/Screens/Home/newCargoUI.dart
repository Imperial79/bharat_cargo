import 'package:bharat_cargo/utils/colors.dart';
import 'package:bharat_cargo/utils/components.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
              children: [
                kSvgIcon(
                  'from_location',
                  color: Colors.black,
                  height: sdp(context, 11),
                ),
                width10,
                Text(
                  'From',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            height5,
            Container(
              width: 80,
              height: 5,
              color: kPrimaryColor,
            ),
            height20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     kSvgIcon(
                    //       'from_location',
                    //       color: Colors.grey,
                    //       height: sdp(context, 11),
                    //     ),
                    //     width10,
                    //     Text(
                    //       'From',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // height5,
                    // Container(
                    //   // as there are 5 fields
                    //   height: 5.2 * sdp(context, 50),
                    //   width: 5,
                    //   color: kPrimaryColor,
                    // ),
                  ],
                ),
                // width10,
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: kRadius(10),
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'From',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        kTextField(
                          context,
                          labelText: 'Full Name',
                          textCapitalization: TextCapitalization.words,
                        ),
                        kTextField(
                          context,
                          labelText: 'Phone',
                          keyboardType: TextInputType.phone,
                        ),
                        kTextField(
                          context,
                          labelText: 'Delivery Comments (Optional)',
                          minLines: 3,
                          maxLines: 3,
                        ),
                        kTextField(
                          context,
                          labelText: 'City, Street, house',
                          minLines: 3,
                          maxLines: 3,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: kTextField(
                                context,
                                labelText: 'Floor',
                                keyboardType: TextInputType.number,
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
