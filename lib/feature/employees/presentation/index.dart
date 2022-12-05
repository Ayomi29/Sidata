// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidata/feature/employees/presentation/edit.dart';
import 'package:sidata/feature/employees/presentation/show.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final String url = 'https://sidata-backend.000webhostapp.com/api/employees';

  Future getEmployee() async {
    var resp = await http.get(Uri.parse(url));
    return json.decode(resp.body);
    print(json.decode(resp.body));
  }

  Future deleteEmployee(String employeeId) async {
    String url2 =
        'https://sidata-backend.000webhostapp.com/api/employees/' + employeeId;
    var response = await http.delete(Uri.parse(url2));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouteName.create_employees);
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text("Data Pegawai Perusahaan"),
        ),
        body: FutureBuilder(
          future: getEmployee(),
          builder: (context, snapshot) {
            return ListView.builder(
                // shrinkWrap: true,
                itemCount: snapshot.data['data'].length,
                itemBuilder: ((context, index) {
                  return Container(
                      height: 100,
                      padding: EdgeInsets.all(5),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    snapshot.data['data'][index]['name'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data['data'][index]['division_id']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailEmployee(
                                                        employee: snapshot
                                                                .data['data']
                                                            [index])));
                                      },
                                      child: Icon(Icons.details_outlined)),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditEmployeeScreen(
                                                      employee: snapshot
                                                          .data['data'][index],
                                                    )));
                                      },
                                      child: Icon(Icons.edit)),
                                  GestureDetector(
                                      onTap: () {
                                        deleteEmployee(snapshot.data['data']
                                                    [index]['id']
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
                            ],
                          ),
                        ),
                      ));
                }));

            // if (snapshot.hasData) {
            // } else {
            //   return Text("Data error");
            // }
          },
        ));
  }
}
