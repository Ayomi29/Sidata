import 'dart:convert';
// import 'package:cool_alert/cool_alert.dart';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditnventoryScreem extends StatelessWidget {
  final Map inventory;

  EditnventoryScreem({required this.inventory});
  // final String url = "https://sidata-backend.000webhostapp.com/api/inventories/";

  final _employeeIdController = TextEditingController();
  final _userIdController = TextEditingController();
  final _itemIdController = TextEditingController();
  final _unitCodeController = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _inventoryCodeController.dispose();
  //   super.dispose();
  // }

  Future updateItem() async {
    print("sending request");
    final resp = await http.put(
        Uri.parse("https://sidata-backend.000webhostapp.com/api/inventories/" +
            inventory['id'].toString()),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          'employee_id': _employeeIdController.text,
          'item_id': _itemIdController.text,
          'user_id': _userIdController.text,
          'unit_code': _unitCodeController.text
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
                  "Update data inventaris",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _employeeIdController
                      ..text = inventory['employee_id'].toString(),
                    decoration: InputDecoration(
                      hintText: 'ID Pegawai',
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
                    controller: _itemIdController
                      ..text = inventory['item_id'].toString(),
                    decoration: InputDecoration(
                      hintText: 'ID Barang',
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
                    controller: _userIdController
                      ..text = inventory['user_id'].toString(),
                    decoration: InputDecoration(
                      hintText: 'ID User',
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
                  // division_code
                  TextField(
                    // ignore: prefer_const_constructors
                    controller: _unitCodeController
                      ..text = inventory['unit_code'].toString(),
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
                  // SizedBox(height: 12),
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
                          updateItem();
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
