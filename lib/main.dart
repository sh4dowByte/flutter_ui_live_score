import 'package:flutter/material.dart';
import 'package:flutter_ui_live_score/screen/screen.dart';

import 'config/app_theme.dart';
import 'config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      onGenerateRoute: Routes.generateRoute,
      home: const SplashScreenPage(),
    );
  }
}
