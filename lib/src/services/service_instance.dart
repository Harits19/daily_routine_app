import 'package:shared_preferences/shared_preferences.dart';

class ServiceInstance {
  static SharedPreferences? _prefs;

  static Future<void> initLocator() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) throw Exception("prefs not initialized");
    return _prefs!;
  }
}
