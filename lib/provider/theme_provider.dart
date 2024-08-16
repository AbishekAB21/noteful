import 'package:flutter/material.dart';
import 'package:noteful/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkmode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
    _saveTheme();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkmode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
    _saveTheme();
  }

  // Load the saved theme mode from SharedPreferences
  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? darkmode : lightMode;
    notifyListeners();
  }

  // Save the current theme mode to SharedPreferences
  void _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _themeData == darkmode);
  }
}
