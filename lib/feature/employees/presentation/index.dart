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
  // final String url = 'https://sidata-backend.000webhostapp.com/api/employees/';

  Future getEmployee() async {
    var resp = await http.get(
        Uri.parse('https://sidata-backend.000webhostapp.com/api/employees/'));
    return jsonDecode(resp.body);
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
        appBar: AppBar(
          title: Text("Data Pegawai Perusahaan"),
        ),
        body: FutureBuilder(
          future: getEmployee(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("data ok");
              // return SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Column(
              //       children: [
              //         Container(
              //             margin: EdgeInsets.only(top: 20),
              //             child: Text(
              //               'Data Pegawai Perusahaan',
              //               style: Theme.of(context).textTheme.headlineMedium,
              //             )),
              //         Container(
              //           margin: EdgeInsets.symmetric(vertical: 20),
              //           child: SizedBox(
              //             child: ElevatedButton(
              //               onPressed: () {
              //                 Navigator.pushNamed(
              //                     context, AppRouteName.create_employees);
              //               },
              //               style: ButtonStyle(
              //                 shape: MaterialStateProperty.all<
              //                     RoundedRectangleBorder>(
              //                   RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(16),
              //                   ),
              //                 ),
              //               ),
              //               child: const Text("Input data baru"),
              //             ),
              //           ),
              //         ),
              //         ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: snapshot.data['data'].length,
              //             itemBuilder: ((context, index) {
              //               return Container(
              //                   height: 100,
              //                   padding: EdgeInsets.all(5),
              //                   child: Card(
              //                     elevation: 5,
              //                     child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceEvenly,
              //                       children: [
              //                         Text(
              //                           snapshot.data['data'][index]['name'],
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.w700),
              //                         ),
              //                         Text(
              //                           snapshot.data['data'][index]
              //                               ['division_id'],
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.w500),
              //                         ),
              //                         GestureDetector(
              //                             onTap: () {
              //                               Navigator.push(
              //                                   context,
              //                                   MaterialPageRoute(
              //                                       builder: (context) =>
              //                                           DetailEmployee(
              //                                               employee:
              //                                                   snapshot.data[
              //                                                           'data']
              //                                                       [index])));
              //                             },
              //                             child: Icon(Icons.details_outlined)),
              //                         GestureDetector(
              //                             onTap: () {
              //                               Navigator.push(
              //                                   context,
              //                                   MaterialPageRoute(
              //                                       builder: (context) =>
              //                                           EditEmployeeScreen(
              //                                             employee: snapshot
              //                                                     .data['data']
              //                                                 [index],
              //                                           )));
              //                             },
              //                             child: Icon(Icons.edit)),
              //                         GestureDetector(
              //                             onTap: () {
              //                               deleteEmployee(snapshot.data['data']
              //                                           [index]['id']
              //                                       .toString())
              //                                   .then((value) => {
              //                                         setState(() {}),
              //                                         ScaffoldMessenger.of(
              //                                                 context)
              //                                             .showSnackBar(SnackBar(
              //                                                 content: Text(
              //                                                     'Data pegawai berhasil di update')))
              //                                       });
              //                             },
              //                             child: Icon(Icons.delete)),
              //                       ],
              //                     ),
              //                   ));
              //             }))
              //       ],
              //     ),
              //   ),
              // );
            } else {
              return Text("Data error");
            }
          },
        ));
  }
}
