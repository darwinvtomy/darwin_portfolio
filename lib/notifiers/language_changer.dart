import 'package:flutter/material.dart';

import '../utils/shared_preference.dart';

class LanguageChangeProvider with ChangeNotifier {
  LanguagePreference languagePreference = LanguagePreference();
  bool _deutsche = false;

  bool get language => _deutsche;

  set language(bool value) {
    _deutsche = value;
    languagePreference.setThevalue(value);
    notifyListeners();
  }
}
