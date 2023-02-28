import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:shared_preferences/shared_preferences.dart';



extension SharedPrefExtension on SharedPreferences {
  String? getStringV2(SharedPrefKey key) {
    return getString(key.name);
  }

  Future<bool> setStringV2(SharedPrefKey key, String value) {
    return setString(key.name, value);
  }
}
