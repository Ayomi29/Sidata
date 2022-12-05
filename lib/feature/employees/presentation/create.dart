import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final String url = "https://sidata-backend.000webhostapp.com/api/employees";
  final _nameController = TextEditingController();
  final _divisionIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _divisionIdController.dispose();
    super.dispose();
  }

  Future createEmployee() async {
    print("sending request");
    final resp = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'division_id': _divisionIdController.text,
        }));
    print("create employee!!");
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100, bottom: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  "Input data pegawai baru",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'nama pegawai baru',
                      fillColor: Colors.grey[200],
                      filled: true,
                      // prefixIcon: Icon(Icons.person_outline),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 12),
                  // pegawaion_code
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _divisionIdController,
                    decoration: InputDecoration(
                      hintText: 'Divisi',
                      fillColor: Colors.grey[200],
                      filled: true,
                      // prefixIcon: Icon(Icons.workspaces_outline),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  // SizedBox(height: 24),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          createEmployee();
                          Navigator.pushNamed(context, AppRouteName.employees);
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: const Text("submit"),
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
