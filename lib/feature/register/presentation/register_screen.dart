import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final String url = "https://sidata-backend.000webhostapp.com/api/register";
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    print("sending request");
    final resp = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text,
        }));
    print("register!!");
    if (resp.statusCode == 200) {
      print("complete");
    } else {
      CoolAlert.show(
          context: context,
          backgroundColor: Color(0xFFff9934),
          type: CoolAlertType.error,
          title: 'Error',
          text: "Data yang Dimasukkan Salah!",
          confirmBtnText: 'Oke',
          confirmBtnColor: Color(0xFFff9934));
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
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.person_outline),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 24),
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
                        onPressed: () {
                          signUp();
                          Navigator.pushNamed(context, AppRouteName.login);
                        },
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
