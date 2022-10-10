import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Inventaris Perusahaan"),
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
                    'Data Inventaris Perusahaan',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRouteName.create_inventories);
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
                    DataColumn(label: Text("Nama Pegawai")),
                    DataColumn(label: Text("Bagian")),
                    DataColumn(label: Text("Type Barang")),
                    DataColumn(label: Text("Brand Barang")),
                    DataColumn(label: Text("Keadaan Barang")),
                    DataColumn(label: Text("Action")),
                  ], rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("1")),
                    DataCell(Text("Laptop Asus Rog")),
                    DataCell(Text("Lead")),
                    DataCell(Text("Direksi")),
                    DataCell(Text("Laptop")),
                    DataCell(Text("Asus")),
                    DataCell(Text("Berfungsi")),
                    DataCell(
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouteName.edit_inventories);
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
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
