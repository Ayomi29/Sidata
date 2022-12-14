// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailEmployee extends StatelessWidget {
  final Map employee;

  DetailEmployee({required this.employee});

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
                        'Nama pegawai:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        employee['name'],
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
                        'Kode divisi:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        employee['division_id'].toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //     onTap: () {
                //       deleteemployee(employee['id']);
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //           content: Text('Data divisi berhasil di hapus')));
                //       Navigator.pushNamed(context, AppRouteName.employees);
                //     },
                //     child: Icon(Icons.delete)),
              ],
            ),
          ),
        ));
  }
}
