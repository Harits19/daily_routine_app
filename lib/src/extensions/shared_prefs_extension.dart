import 'package:shared_preferences/shared_preferences.dart';

enum SharedPrefKey {
  checkedTask,
  task,
  themeMode;
}

extension SharedPrefExtension on SharedPreferences {
  String? getStringV2(SharedPrefKey key) {
    return getString(key.name);
  }

  Future<bool> setStringV2(SharedPrefKey key, String value) {
    return setString(key.name, value);
  }
}
