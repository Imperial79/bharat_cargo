import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget kSvgImage(
  String imgLabel, {
  double? height,
  ColorFilter? colorFilter,
}) =>
    SvgPicture.asset(
      'assets/icons/$imgLabel.svg',
      height: height,
      colorFilter: colorFilter,
    );
