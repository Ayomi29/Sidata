import 'dart:convert';
import 'package:cool_alert/cool_alert.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateInventoryScreen extends StatefulWidget {
  const CreateInventoryScreen({super.key});

  @override
  State<CreateInventoryScreen> createState() => _CreateInventoryScreenState();
}

class _CreateInventoryScreenState extends State<CreateInventoryScreen> {
  final String url = "https://sidata-backend.000webhostapp.com/api/inventories";
  final _employeeIdController = TextEditingController();
  final _userIdController = TextEditingController();
  final _itemIdController = TextEditingController();
  final _unitCodeController = TextEditingController();

  @override
  void dispose() {
    _employeeIdController.dispose();
    _userIdController.dispose();
    _itemIdController.dispose();
    _unitCodeController.dispose();
    super.dispose();
  }

  Future createInventory() async {
    print("sending request create inventory!");
    final resp = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          'employee_id': _employeeIdController.text,
          'user_id': _userIdController.text,
          'item_id': _itemIdController.text,
          'unit_code': _unitCodeController.text
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
                  "Input data inventaris baru",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _employeeIdController,
                    decoration: InputDecoration(
                      hintText: 'ID pegawai',
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

                  // id barang
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _itemIdController,
                    decoration: InputDecoration(
                      hintText: 'ID barang',
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
                    controller: _userIdController,
                    decoration: InputDecoration(
                      hintText: 'ID user petugas',
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
                    controller: _unitCodeController,
                    decoration: InputDecoration(
                      hintText: 'Kode unit barang',
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
                          createInventory();
                          Navigator.pushNamed(
                              context, AppRouteName.inventories);
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
