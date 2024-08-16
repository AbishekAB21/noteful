import 'package:flutter/material.dart';

AppColor appcolor = AppDefaultColor();

abstract class AppColor {
  final Color primaryColor;
  final Color secondaryColor;
  final Color teritiaryColor;

  AppColor({
    required this.primaryColor,
    required this.secondaryColor,
    required this.teritiaryColor,
  });
}

class AppDefaultColor extends AppColor {
  AppDefaultColor()
      : super(
            primaryColor: Colors.white,
            secondaryColor: Colors.black,
            teritiaryColor: Colors.green);
}
