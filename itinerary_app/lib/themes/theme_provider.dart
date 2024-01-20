import 'package:flutter/material.dart';
import 'package:itinerary_app/themes/dark_mode.dart';
import 'package:itinerary_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  //Toggle theme
  void toggleTheme() {
    themeData = ((_themeData == darkMode) ? lightMode : darkMode);
  }
}
