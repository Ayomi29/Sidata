import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Pegawai Perusahaan"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Data Pegawai Perusahaan',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRouteName.create_employees);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: const Text("Input data baru"),
                  ),
                ),
              ),
              DataTable(
                // ignore: prefer_const_literals_to_create_immutables
                columns: <DataColumn>[
                  DataColumn(label: Text("#")),
                  DataColumn(label: Text("Nama Pegawai")),
                  DataColumn(label: Text("Nama Bagian")),
                  DataColumn(label: Text("Action")),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("1")),
                      DataCell(Text("Lead")),
                      DataCell(Text("Direksi")),
                      DataCell(
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.edit_employees);
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
                      DataCell(Text("Adama")),
                      DataCell(Text("Bagian Umum")),
                      DataCell(
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.edit_employees);
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
            ],
          ),
        ),
      ),
    );
  }
}
