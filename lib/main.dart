import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sidata/main_auth.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      home: MainPage(),
      onGenerateRoute: AppRoute.generate,
    );
  }
}
