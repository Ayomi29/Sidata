// import 'package:sidata/core/component/app_text_field.dart';
// import 'package:sidata/core/theme/app_color.dart';
// import 'package:flutter/gestures.dart';
// ignore_for_file: prefer_const_constructors

import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

// class DivisionScreen extends StatelessWidget {
//   const DivisionScreen({super.key});

//   @override

// }
class DivisionScreen extends StatefulWidget {
  const DivisionScreen({super.key});

  @override
  _DivisionScreenState createState() => _DivisionScreenState();
}

class _DivisionScreenState extends State<DivisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Divisi Perusahaan"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              DataTable(
                // ignore: prefer_const_literals_to_create_immutables
                columns: <DataColumn>[
                  DataColumn(label: Text("#")),
                  DataColumn(label: Text("Nama Bagian")),
                  DataColumn(label: Text("Kode Bagian")),
                  DataColumn(label: Text("Action")),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("1")),
                      DataCell(Text("Direksi")),
                      DataCell(Text("A01")),
                      DataCell(
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.employees);
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            child: const Text("Update"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("2")),
                      DataCell(Text("Bagian Umum")),
                      DataCell(Text("A10")),
                      DataCell(
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.employees);
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            child: const Text("Update"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouteName.divisions);
                  },
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
