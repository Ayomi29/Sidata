import 'package:sidata/core/route/app_route_name.dart';

import 'package:sidata/feature/login/presentation/login_screen.dart';

import 'package:sidata/feature/register/presentation/register_screen.dart';
import 'package:sidata/feature/homepage/presentation/homepage_screen.dart';
import 'package:sidata/feature/divisions/presentation/index.dart';
import 'package:sidata/feature/divisions/presentation/create.dart';
import 'package:sidata/feature/divisions/presentation/edit.dart';
import 'package:sidata/feature/employees/presentation/index.dart';
import 'package:sidata/feature/employees/presentation/create.dart';
import 'package:sidata/feature/employees/presentation/edit.dart';
import 'package:sidata/feature/inventories/presentation/index.dart';
import 'package:sidata/feature/inventories/presentation/edit.dart';
import 'package:sidata/feature/inventories/presentation/create.dart';
import 'package:sidata/feature/items/presentation/index.dart';
import 'package:sidata/feature/items/presentation/create.dart';
import 'package:sidata/feature/items/presentation/edit.dart';

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
      case AppRouteName.employees:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const EmployeeScreen(),
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
      case AppRouteName.create_employees:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => CreateEmployeeScreen(),
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

      case AppRouteName.divisions:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const DivisionScreen(),
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
      case AppRouteName.create_division:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => CreateDivisionScreen(),
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

      case AppRouteName.items:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const ItemScreen(),
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
      case AppRouteName.create_items:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const CreateItemScreen(),
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
      // case AppRouteName.edit_items:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (_, __, ___) => EditItemScreen(item),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (_, animation, __, child) {
      //       // slide in transition,
      //       // from bottom (y = 1) to center (y = 0) screen
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(0, 1),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //   );
      case AppRouteName.inventories:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const InventoryScreen(),
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
      case AppRouteName.create_inventories:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const CreateInventoryScreen(),
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
      // case AppRouteName.edit_inventories:
      //   return PageRouteBuilder(
      //     settings: settings,
      //     pageBuilder: (_, __, ___) => const EditInventoryScreen(),
      //     transitionDuration: const Duration(milliseconds: 400),
      //     transitionsBuilder: (_, animation, __, child) {
      //       // slide in transition,
      //       // from bottom (y = 1) to center (y = 0) screen
      //       return SlideTransition(
      //         position: Tween<Offset>(
      //           begin: const Offset(0, 1),
      //           end: Offset.zero,
      //         ).animate(animation),
      //         child: child,
      //       );
      //     },
      //   );
    }

    return null;
  }
}
