import 'package:flutter/material.dart';

class Fontstyles {
  static TextStyle boldTextStyle() {
    return TextStyle(
        fontSize: 42.0, fontWeight: FontWeight.w400, fontFamily: "Pacifico");
  }

  static TextStyle RegularTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w300,
        fontFamily: "Merriweather Sans");
  }

  static TextStyle FadedTextStyle(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontFamily: "Merriweather Sans",
        
        );
  }

  static TextStyle buttontext(BuildContext context) {
    return TextStyle(
        fontSize: 15.0,
        color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w500,
        fontFamily: "Merriweather Sans");
  }

  static TextStyle buttontext2(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w500, fontFamily: "Merriweather Sans");
  }

   static TextStyle buttontext3(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
        fontWeight: FontWeight.w600, fontFamily: "Merriweather Sans");
  }

  static TextStyle notesText(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
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
