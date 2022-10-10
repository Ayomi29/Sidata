import 'package:sidata/core/component/app_text_field.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_constructors
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.contain,
                image: const AssetImage("assets/img_login.png"),
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppTextField(
                    prefix: Icon(Icons.alternate_email_rounded),
                    hint: "Email Address",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    obscureText: true,
                    prefix: Icon(Icons.lock_outline_rounded),
                    suffix: Icon(Icons.remove_red_eye_outlined),
                    hint: "Password",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              SizedBox(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouteName.homepage);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an Account ? ",
                        style: Theme.of(context).textTheme.button,
                      ),
                      TextSpan(
                        text: "Register here!",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              AppRouteName.register,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
