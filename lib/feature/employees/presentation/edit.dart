import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sidata/core/component/app_text_field.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:http/http.dart' as http;
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class EditEmployeeScreen extends StatelessWidget {
  // const EditEmployeeScreen({super.key});
  final Map employee;

  EditEmployeeScreen({required this.employee});
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _divisionIdController = TextEditingController();

  Future updateEmployee() async {
    final resp = await http.put(
        Uri.parse("https://sidata-backend.000webhostapp.com/api/employees/" +
            employee['id'].toString()),
        body: {
          "name": _nameController,
          "division_id": _divisionIdController,
        });
    return json.decode(resp.body);
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 100, bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  "Input Data Baru",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _nameController..text = employee['name'],
                      decoration: InputDecoration(labelText: "Employee name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan input dengan benar";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _divisionIdController
                        ..text = employee['division_id'],
                      decoration: InputDecoration(labelText: "division id"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "masukan input dengan benar";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(height: 16),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            updateEmployee().then((value) {
                              Navigator.pushNamed(
                                context,
                                AppRouteName.employees,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Data pegawai berhasil di update')));
                            });
                          } else {}
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        child: const Text("Submit"),
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
