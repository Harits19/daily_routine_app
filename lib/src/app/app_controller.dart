import 'package:daily_routine_app/src/localization/localization.dart';
import 'package:daily_routine_app/src/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final appNotifier = StateNotifierProvider<AppNotifier, AppProvider>(
    (ref) => AppNotifier()..initApp());

class AppNotifier extends StateNotifier<AppProvider> {
  AppNotifier() : super(AppProvider());
  void initApp() async {
    final themeMode = AppService.getThemeMode();
    final myLanguage = AppService.getMyLanguage();
    final packageInfo = await AppService.getAppDetail();
    state = AppProvider(
      myLanguage: myLanguage,
      packageInfo: packageInfo,
      themeMode: themeMode,
    );
  }

  void setThemeMode(ThemeMode themeMode) async {
    await AppService.setThemeMode(themeMode);
    state = state.copyWith(themeMode: AppService.getThemeMode());
  }

  void setLanguage(MyLanguage myLanguage) async {
    await AppService.setMyLanguage(myLanguage);
    state = state.copyWith(myLanguage: AppService.getMyLanguage());
  }
}

class AppProvider {
  final ThemeMode? themeMode;
  final PackageInfo? packageInfo;
  final MyLanguage myLanguage;

  AppProvider({
    this.themeMode,
    this.packageInfo,
    this.myLanguage = MyLanguage.en,
  });

  AppProvider copyWith(
      {ThemeMode? themeMode,
      PackageInfo? packageInfo,
      MyLanguage? myLanguage}) {
    return AppProvider(
      themeMode: themeMode ?? this.themeMode,
      myLanguage: myLanguage ?? this.myLanguage,
      packageInfo: packageInfo ?? this.packageInfo,
    );
  }
}
