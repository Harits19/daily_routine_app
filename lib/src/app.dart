import 'package:daily_routine_app/src/checked_task/checked_task_controller.dart';
import 'package:daily_routine_app/src/home/home.dart';
import 'package:daily_routine_app/src/app/app_controller.dart';
import 'package:daily_routine_app/src/task/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskController()..getTask(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppController()..initApp(),
        ),
        ChangeNotifierProxyProvider<TaskController, CheckedTaskController>(
          create: (_) => CheckedTaskController(),
          update: (_, myModel, myNotifier) =>
              (myNotifier ?? (CheckedTaskController()..getListCheckedTask()))
                ..getListCheckedTask()
                ..update(myModel),
        )
      ],
      child: Consumer<AppController>(builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          themeMode: theme.themeMode,
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('id', ''),
          ],
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          home: const Home(),
        );
      }),
    );
  }
}
