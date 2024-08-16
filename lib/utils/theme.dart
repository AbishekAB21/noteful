import 'package:flutter/material.dart';

// light mode
ThemeData lightMode = ThemeData(
  brightness: Brightness.light, // Match with ColorScheme.light
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade900,
    brightness: Brightness.light, // Ensure this matches ThemeData.brightness
  ),
);

// dark mode
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark, // Match with ColorScheme.dark
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 26, 26, 26),
    primary: Color.fromARGB(255, 42, 42, 42),
    secondary: Color.fromARGB(255, 50, 50, 50),
    inversePrimary: Colors.grey.shade300,
    brightness: Brightness.dark, // Ensure this matches ThemeData.brightness
  ),
);
