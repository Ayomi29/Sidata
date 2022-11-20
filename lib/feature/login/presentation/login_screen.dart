import 'package:sidata/core/component/app_text_field.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                children: [
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    obscureText: true,
                    // ignore: prefer_const_constructors
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: signIn,
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
