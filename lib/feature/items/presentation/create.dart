import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:sidata/core/component/app_text_field.dart';
import 'package:sidata/core/route/app_route_name.dart';

import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CreateItemScreen extends StatefulWidget {
  const CreateItemScreen({super.key});

  @override
  State<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen> {
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _brandController = TextEditingController();
  final _serialController = TextEditingController();
  final _purchaseController = TextEditingController();
  final _macAddController = TextEditingController();
  final _ipAddController = TextEditingController();
  final _itemStateController = TextEditingController();

  final String url = "https://sidata-backend.000webhostapp.com/api/items";

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _brandController.dispose();
    _serialController.dispose();
    _purchaseController.dispose();
    _macAddController.dispose();
    _ipAddController.dispose();
    _itemStateController.dispose();
    super.dispose();
  }

  Future createItem() async {
    print("sending request");
    final resp = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          'name': _nameController.text,
          'type': _typeController.text,
          'brand': _brandController.text,
          'serial': _serialController.text,
          'purchase_date': _purchaseController.text,
          'mac_address': _macAddController.text,
          'ip_address': _ipAddController.text,
          'item_state': _itemStateController.text,
        }));
    print("create item!!");
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
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Nama barang',
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
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _typeController,
                    decoration: InputDecoration(
                      hintText: 'Tipe barang',
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
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _brandController,
                    decoration: InputDecoration(
                      hintText: 'Brand barang',
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
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _serialController,
                    decoration: InputDecoration(
                      hintText: 'Serial number barang',
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
                  SizedBox(height: 12),
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _purchaseController,
                    decoration: InputDecoration(
                      hintText: 'Tanggal beli barang',
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
                  SizedBox(height: 12),
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _macAddController,
                    decoration: InputDecoration(
                      hintText: 'Mac address barang',
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
                  SizedBox(height: 12),
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _ipAddController,
                    decoration: InputDecoration(
                      hintText: 'IP address barang',
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
                  SizedBox(height: 12),
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _itemStateController,
                    decoration: InputDecoration(
                      hintText: 'Keadaan barang',
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
                  SizedBox(height: 12),
                ],
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
                          createItem();
                          Navigator.pushNamed(
                            context,
                            AppRouteName.items,
                          );
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
