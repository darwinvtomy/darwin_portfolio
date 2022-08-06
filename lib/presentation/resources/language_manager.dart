import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, GERMAN }

const String GERMAN = "de";
const String ENGLISH = "en";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";
const Locale ARABIC_LOCAL = Locale("de", "DE");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.GERMAN:
        return GERMAN;
    }
  }
}
