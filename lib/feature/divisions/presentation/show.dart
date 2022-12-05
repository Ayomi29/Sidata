// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sidata/core/route/app_route.dart';
import 'package:sidata/core/route/app_route_name.dart';

class DetailDivision extends StatelessWidget {
  final Map division;

  DetailDivision({required this.division});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail Divisi")),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100, bottom: 30),
                  child: Text(
                    'Detail data divisi',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Nama divisi:',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        division['name'],
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
                        division['division_code'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //     onTap: () {
                //       deleteDivision(division['id']);
                //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //           content: Text('Data divisi berhasil di hapus')));
                //       Navigator.pushNamed(context, AppRouteName.divisions);
                //     },
                //     child: Icon(Icons.delete)),
              ],
            ),
          ),
        ));
  }
}
