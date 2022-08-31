import 'package:flutter/material.dart';

class LanguageChangeProvider with ChangeNotifier {
  bool _deutsche = false;

  bool get language => _deutsche;

  set language(bool value) {
    _deutsche = value;
    notifyListeners();
  }
}
