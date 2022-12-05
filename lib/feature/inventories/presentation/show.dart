// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailInventory extends StatelessWidget {
  final Map inventory;

  DetailInventory({required this.inventory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail Pegawai")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100, bottom: 30),
                  child: Text(
                    'Detail data pegawai',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ID pegawai:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        inventory['employee_id'].toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ID barang:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        inventory['item_id'].toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ID user petugas:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        inventory['user_id'].toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Kode Unit Barang:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        inventory['unit_code'].toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //     onTap: () {
                //       deleteinventory(inventory['id']);
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //           content: Text('Data divisi berhasil di hapus')));
                //       Navigator.pushNamed(context, AppRouteName.inventorys);
                //     },
                //     child: Icon(Icons.delete)),
              ],
            ),
          ),
        ));
  }
}
