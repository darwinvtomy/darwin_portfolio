import 'package:flutter/material.dart';

import '../utils/shared_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  set isDarkTheme(bool value) {
    _isDarkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
