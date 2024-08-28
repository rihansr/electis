import 'package:shared_preferences/shared_preferences.dart';

import '../models/other/settings_model.dart';
final sharedPrefs = SharedPrefs.value;

class SharedPrefs {
  static SharedPrefs get value => SharedPrefs._();
  SharedPrefs._();

  late SharedPreferences _sharedPrefs;

  Future<void> init() async => _sharedPrefs = await SharedPreferences.getInstance();

  static const String _settingsKey = "settings_sp_key";

  // Settings
  set settings(Settings settings) =>
      _sharedPrefs.setString(_settingsKey, settings.toJson());

  Settings get settings {
    final settings = _sharedPrefs.getString(_settingsKey);
    return settings == null ? const Settings() : Settings.fromJson(settings);
  }
}
