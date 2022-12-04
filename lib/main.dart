import 'package:flutter/material.dart';
import 'package:sidata/feature/login/presentation/login_screen.dart';
import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sidata",
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      home: LoginScreen(),
      onGenerateRoute: AppRoute.generate,
    );
  }
}
