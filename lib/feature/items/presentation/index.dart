import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Asset Perusahaan"),
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
                    'Data Asset Perusahaan',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouteName.create_items);
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
                  DataColumn(label: Text("Nama Barang")),
                  DataColumn(label: Text("Type Barang")),
                  DataColumn(label: Text("Brand Barang")),
                  DataColumn(label: Text("Keadaan Barang")),
                  DataColumn(label: Text("Action")),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text("1")),
                      DataCell(Text("Laptop Asus Rog")),
                      DataCell(Text("Laptop")),
                      DataCell(Text("Asus")),
                      DataCell(Text("Berfungsi")),
                      DataCell(
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteName.edit_items);
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
