import 'package:flutter/material.dart';
import 'package:noteful/utils/theme.dart';

class ThemeProvider with ChangeNotifier{

// light mode by default
  ThemeData _themeData = lightMode;

// getter method to access the theme from theme.dart 
  ThemeData get themeData => _themeData;

// getter method to check if we are in dark mode
  bool get isDarkMode => _themeData == darkmode;

// setter method to set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

// toggle between themes
  void toggleTheme() {
    if(_themeData == lightMode){
      _themeData = darkmode;
    }else{
      _themeData = lightMode;
    }
  }

}