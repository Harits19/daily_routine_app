import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:daily_routine_app/src/extensions/shared_prefs_extension.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppService {
  static Future<PackageInfo> getAppDetail() {
    return PackageInfo.fromPlatform();
  }

  static ThemeMode getThemeMode() {
    final result = ServiceInstance.prefs.getStringV2(SharedPrefKey.themeMode);
    if (result == null) return ThemeMode.system;
    final themeMode = ThemeMode.values.byName(result);
    return themeMode;
  }

  static Future<void> setThemeMode(ThemeMode themeMode) {
    return ServiceInstance.prefs
        .setStringV2(SharedPrefKey.themeMode, themeMode.name);
  }
}
