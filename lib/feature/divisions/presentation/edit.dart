import 'dart:convert';
// import 'package:cool_alert/cool_alert.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditDivisionScreen extends StatelessWidget {
  final Map division;

  EditDivisionScreen({required this.division});
  // final String url = "https://sidata-backend.000webhostapp.com/api/divisions/";
  final _nameController = TextEditingController();
  final _divisionCodeController = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _divisionCodeController.dispose();
  //   super.dispose();
  // }

  Future updateDivision() async {
    print("sending request");
    final resp = await http.put(
        Uri.parse("https://sidata-backend.000webhostapp.com/api/divisions/" +
            division['id'].toString()),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'division_code': _divisionCodeController.text,
        }));
    print("update divisi!!");
    if (resp.statusCode == 200) {
      print("complete");
    } else {
      ScaffoldMessenger(child: Text('Data input error'));
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
                  "Update data divisi",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    // ignore: prefer_const_constructors
                    // controller: _nameController..text = division['name'],
                    decoration: InputDecoration(
                      hintText: 'nama divisi',
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
                  SizedBox(height: 24),
                  // division_code
                  TextField(
                    // ignore: prefer_const_constructors
                    // controller: _divisionCodeController..text = division['division_code'],
                    decoration: InputDecoration(
                      hintText: 'kode divisi',
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
                          updateDivision();
                          Navigator.pushNamed(context, AppRouteName.divisions);
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
