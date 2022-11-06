import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sidata/core/route/app_route_name.dart';

import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

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
        child: Padding(
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
                image: const AssetImage("assets/img_register.png"),
              ),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // email address
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

                  // password
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
                  // confirm password
                  TextField(
                    obscureText: true,
                    // ignore: prefer_const_constructors
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By signing up, you're agree to our ",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextSpan(
                            text: "Term & Condition",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: AppColor.primaryColor),
                          ),
                          TextSpan(
                            text: " and ",
                            style: Theme.of(context).textTheme.button,
                          ),
                          TextSpan(
                            text: "privacy Policy",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 16),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: signUp,
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: const Text("Register"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
