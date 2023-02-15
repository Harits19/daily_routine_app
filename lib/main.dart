import 'package:flutter/material.dart';

import 'src/app.dart';
import 'package:daily_routine_app/src/services/service_instance.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.

  await ServiceInstance.initLocator();
  runApp(const MyApp());
}
