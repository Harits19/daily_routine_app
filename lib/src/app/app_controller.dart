import 'package:daily_routine_app/src/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController with ChangeNotifier {
  ThemeMode? themeMode;
  PackageInfo? packageInfo;

  void initApp() {
    themeMode = ThemeMode.system;
    AppService.getAppDetail().then((value) {
      packageInfo = value;
      notifyListeners();
    });
  }

  void setThemeMode(ThemeMode? themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
