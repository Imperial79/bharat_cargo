import 'package:bharat_cargo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const String kSvgPath = "assets/icons/";

Widget kSvgImage(
  String imgLabel, {
  double? height,
  Color color = Colors.black,
}) =>
    SvgPicture.asset(
      'assets/icons/$imgLabel.svg',
      height: height,
      colorFilter: kSvgColor(color),
    );

Widget kAssetImage(
  String imgLabel, {
  double? height,
}) =>
    Image.asset(
      'assets/images/$imgLabel.png',
      height: height,
    );

BorderRadius kRadius(double radius) => BorderRadius.circular(radius);
BorderRadius kRadiusOnly({
  double topLeft = 0,
  double bottomLeft = 0,
  double topRight = 0,
  double bottomRight = 0,
}) =>
    BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      bottomLeft: Radius.circular(bottomLeft),
      topRight: Radius.circular(topRight),
      bottomRight: Radius.circular(bottomRight),
    );
