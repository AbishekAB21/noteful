import 'package:flutter/material.dart';

class Fontstyles {
  static TextStyle boldTextStyle() {
    return TextStyle(
        fontSize: 42.0, fontWeight: FontWeight.w400, fontFamily: "Pacifico");
  }

  static TextStyle buttontext() {
    return TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        fontFamily: "Merriweather Sans");
  }

  static TextStyle buttontext2() {
    return TextStyle(
        fontWeight: FontWeight.w500, fontFamily: "Merriweather Sans");
  }

  static TextStyle notesText() {
    return TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        fontFamily: "Merriweather Sans");
  }

  static TextStyle boldtextMerriweatherSans(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 35.0,
        fontWeight: FontWeight.w700,
        fontFamily: "Merriweather Sans");
  }
}
