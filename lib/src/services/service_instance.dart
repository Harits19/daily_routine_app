import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
