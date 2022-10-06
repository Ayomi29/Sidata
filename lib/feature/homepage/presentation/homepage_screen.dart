import 'package:flutter/material.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage Sidata'),
        ),
        body: const Center(
          child: Text('Homepage Sidata'),
        ),
      ),
    );
  }
}
