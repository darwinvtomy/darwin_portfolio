import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

class LanguagePreference {
  static const LANGUAGE_STATUS = "LANGUAGESTATUS";

  setThevalue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LANGUAGE_STATUS, value);
  }

  Future<bool> getTheValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LANGUAGE_STATUS) ?? false;
  }
}
