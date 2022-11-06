import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sidata/feature/homepage/presentation/homepage_screen.dart';
import 'package:sidata/feature/login/presentation/login_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomepageScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
