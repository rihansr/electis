import 'package:flutter/material.dart';
import '../models/settings_model.dart';
import '../shared/shared_prefs.dart';

final AppSettings appSettings = AppSettings.value;

class AppSettings {
  static AppSettings get value => AppSettings._();
  AppSettings._();

  ValueNotifier<Settings> settings = ValueNotifier(sharedPrefs.settings);

  set _settings(Settings settings) {
    this.settings.value = settings;
    sharedPrefs.settings = settings;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    this.settings.notifyListeners();
  }

  // Theme
  set theme(ThemeMode mode) =>
      _settings = settings.value.copyWith(themeMode: mode);

  ThemeMode get theme => settings.value.themeMode;

  // Locale
  set language(dynamic locale) {
    if (locale == null) return;
    _settings = settings.value.copyWith(
      locale: locale is Locale ? locale : Locale('$locale', ''),
    );
  }
}