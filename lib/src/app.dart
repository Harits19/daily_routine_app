import 'package:daily_routine_app/src/home/home.dart';
import 'package:daily_routine_app/src/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    hide ChangeNotifierProvider;

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        themeMode: ref.watch(appProvider).themeMode,
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('id', ''),
        ],
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        home: const Home(),
      ),
    );
  }
}
