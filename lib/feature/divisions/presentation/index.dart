// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:sidata/feature/divisions/presentation/create.dart';
import 'package:sidata/feature/divisions/presentation/edit.dart';
import 'package:sidata/feature/divisions/presentation/show.dart';

class DivisionScreen extends StatefulWidget {
  const DivisionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DivisionScreenState createState() => _DivisionScreenState();
}

class _DivisionScreenState extends State<DivisionScreen> {
  final String url = 'https://sidata-backend.000webhostapp.com/api/divisions/';

  Future getDivisions() async {
    var resp = await http.get(Uri.parse(url));
    print(jsonDecode(resp.body));
    return jsonDecode(resp.body);
  }

  Future deleteDivision(String divisionId) async {
    String url =
        'https://sidata-backend.000webhostapp.com/api/divisions/' + divisionId;
    var response = await http.delete(Uri.parse(url));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Divisi Perusahaan"),
      ),
      body: FutureBuilder(
        future: getDivisions(),
        builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (((context, index) {
                return Container(
                    height: 100,
                    padding: EdgeInsets.all(5),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            snapshot.data['data'][index]['name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            snapshot.data['data'][index]['division_code'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailDivision(
                                            division: snapshot.data['data']
                                                [index])));
                              },
                              child: Icon(Icons.details_outlined)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditDivisionScreen(
                                              division: snapshot.data['data']
                                                  [index],
                                            )));
                              },
                              child: Icon(Icons.edit)),
                          GestureDetector(
                              onTap: () {
                                deleteDivision(snapshot.data['data'][index]
                                            ['id']
                                        .toString())
                                    .then((value) => {
                                          setState(() {}),
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Data pegawai berhasil di update')))
                                        });
                              },
                              child: Icon(Icons.delete)),
                        ],
                      ),
                    ));
              })),
            );
          // if (snapshot.hasData) {
          // } else {
          //   return Text("Data error");
          // }
        },
      ),
    );
  }
}
