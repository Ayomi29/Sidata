// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:sidata/feature/divisions/presentation/create.dart';
import 'package:sidata/feature/divisions/presentation/edit.dart';
import 'package:sidata/feature/divisions/presentation/show.dart';

class Data {
  final String name;
  final String division_code;
  const Data({
    required this.name,
    required this.division_code,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(name: json['name'], division_code: json['division_code']);
  }
}

class Division {
  final String message;
  final int status;
  final Data data;

  const Division({
    required this.message,
    required this.status,
    required this.data,
  });

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
        message: json['message'], status: json['status'], data: json['data']);
  }
}

class DivisionScreen extends StatefulWidget {
  const DivisionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DivisionScreenState createState() => _DivisionScreenState();
}

class _DivisionScreenState extends State<DivisionScreen> {
  final String url = 'https://sidata-backend.000webhostapp.com/api/divisions';

  Future<Division> getDivisions() async {
    var resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      return Division.fromJson(jsonDecode(resp.body));
      print(jsonDecode(resp.body));
    } else {
      throw Exception('faild load data!');
    }
  }

  Future deleteDivision(String divisionId) async {
    String url2 =
        'https://sidata-backend.000webhostapp.com/api/divisions/' + divisionId;
    var response = await http.delete(Uri.parse(url2));
    return jsonDecode(response.body);
  }

  late Future<Division> futureDivision;
  @override
  void initState() {
    super.initState();
    futureDivision = getDivisions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouteName.create_division);
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text("Data Divisi Perusahaan"),
      ),
      body: FutureBuilder<Division>(
        future: futureDivision,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.data.name.length,
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
                          snapshot.data!.data.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          snapshot.data!.data.division_code,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => DetailDivision(
                            //               division: snapshot.data!)));
                            // },
                            child: Icon(Icons.details_outlined)),
                        GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               EditDivisionScreen(
                            //                 division: snapshot
                            //                     .data['divisions'][index],
                            //               )));
                            // },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            // onTap: () {
                            //   deleteDivision(snapshot.data['divisions'][index]
                            //               ['id']
                            //           .toString())
                            //       .then((value) => {
                            //             setState(() {}),
                            //             ScaffoldMessenger.of(context)
                            //                 .showSnackBar(SnackBar(
                            //                     content: Text(
                            //                         'Data pegawai berhasil di update')))
                            //           });
                            // },
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
