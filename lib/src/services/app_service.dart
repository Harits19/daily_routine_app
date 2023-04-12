import 'package:daily_routine_app/src/enums/my_language.dart';
import 'package:daily_routine_app/src/enums/shared_pref_key.dart';
import 'package:daily_routine_app/src/extensions/shared_prefs_extension.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppService {
  Future<PackageInfo> getAppDetail() {
    return PackageInfo.fromPlatform();
  }

  ThemeMode getThemeMode() {
    final result = ServiceInstance().prefs.getStringV2(SharedPrefKey.themeMode);
    if (result == null) return ThemeMode.system;
    final themeMode = ThemeMode.values.byName(result);
    return themeMode;
  }

  Future<void> setThemeMode(ThemeMode themeMode) {
    return ServiceInstance()
        .prefs
        .setStringV2(SharedPrefKey.themeMode, themeMode.name);
  }

  Future<void> setMyLanguage(MyLanguage myLanguage) {
    return ServiceInstance()
        .prefs
        .setStringV2(SharedPrefKey.language, myLanguage.name);
  }

  MyLanguage getMyLanguage() {
    final result = ServiceInstance().prefs.getStringV2(SharedPrefKey.language);
    if (result == null) return MyLanguage.en;
    final myLanguage = MyLanguage.values.byName(result);
    return myLanguage;
  }
}
