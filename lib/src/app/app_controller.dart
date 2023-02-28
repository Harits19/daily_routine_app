import 'package:daily_routine_app/src/localization/localization.dart';
import 'package:daily_routine_app/src/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController with ChangeNotifier {
  ThemeMode? themeMode;
  PackageInfo? packageInfo;
  MyLanguage myLanguage = MyLanguage.en;

  void initApp() async {
    themeMode = AppService.getThemeMode();
    myLanguage = AppService.getMyLanguage();
    packageInfo = await AppService.getAppDetail();
    notifyListeners();
  }

  void setThemeMode(ThemeMode themeMode) async {
    await AppService.setThemeMode(themeMode);
    this.themeMode = AppService.getThemeMode();
    notifyListeners();
  }

  void setLanguage(MyLanguage myLanguage) async {
    await AppService.setMyLanguage(myLanguage);
    this.myLanguage = AppService.getMyLanguage();
    notifyListeners();
  }
}
