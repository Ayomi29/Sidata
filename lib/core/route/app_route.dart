import 'package:sidata/core/route/app_route_name.dart';

import 'package:sidata/feature/login/presentation/login_screen.dart';

import 'package:sidata/feature/register/presentation/register_screen.dart';
import 'package:sidata/feature/homepage/presentation/homepage_screen.dart';

import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case AppRouteName.register:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const RegisterScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            // slide in transition,
            // from bottom (y = 1) to center (y = 0) screen
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case AppRouteName.homepage:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const HomepageScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            // slide in transition,
            // from bottom (y = 1) to center (y = 0) screen
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
    }

    return null;
  }
}
