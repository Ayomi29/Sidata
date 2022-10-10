import 'package:flutter/material.dart';

class MenuImage extends StatelessWidget {
  const MenuImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(top: 50),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Text(
            "WELCOME TO SIDATA",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              'assets/logo_md.png',
              width: MediaQuery.of(context).size.width / 1.8,
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 16 * 2),

          // ignore: prefer_const_constructors
          SizedBox(height: 16 * 2),
        ],
      ),
    );

    // return Column(
    //   // ignore: prefer_const_literals_to_create_immutables
    //   children: [
    //     // ignore: prefer_const_constructors
    //     Text(
    //       "WELCOME TO SIDATA",
    //       style: const TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //     // ignore: prefer_const_constructors
    //     SizedBox(height: 16 * 2),

    //     // ignore: prefer_const_constructors
    //     SizedBox(height: 16 * 2),
    //   ],
    // );
  }
}
