import 'package:daily_routine_app/src/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController with ChangeNotifier {
  ThemeMode? themeMode;
  PackageInfo? packageInfo;

  void initApp() async {
    themeMode = AppService.getThemeMode();
    packageInfo = await AppService.getAppDetail();
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) async {
    await AppService.setThemeMode(themeMode);
    this.themeMode = AppService.getThemeMode();
    notifyListeners();
  }
}
