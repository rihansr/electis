import 'package:flutter/material.dart';

enum AlertType { success, error, info }

enum Language {
  english,
  arabic;

  String get displayName {
    switch (this) {
      case Language.arabic:
        return 'العربية';
      default:
        return 'English';
    }
  }

  Locale get locale {
    switch (this) {
      case Language.arabic:
        return const Locale('ar', 'EG');
      default:
        return const Locale('en', 'US');
    }
  }
}
