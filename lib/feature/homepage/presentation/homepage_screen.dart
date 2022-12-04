import 'package:flutter/material.dart';
import 'package:sidata/core/responsive.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:sidata/feature/homepage/component/menu_btn.dart';
import 'package:sidata/feature/homepage/component/menu_image.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: MenuImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 450,
                        child: MenuBtn(),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // logout();
                  },
                  color: AppColor.primaryColor,
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            mobile: const MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const MenuImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: MenuBtn(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
