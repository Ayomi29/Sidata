import 'dart:convert';
import 'package:sidata/core/route/app_route_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidata/feature/employees/presentation/edit.dart';
import 'package:sidata/feature/items/presentation/edit.dart';
import 'package:sidata/feature/items/presentation/show.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final String url = 'https://sidata-backend.000webhostapp.com/api/items';

  Future getItems() async {
    var resp = await http.get(Uri.parse(url));
    print(jsonDecode(resp.body));
    return jsonDecode(resp.body);
  }

  Future deleteItem(String itemId) async {
    String url2 =
        'https://sidata-backend.000webhostapp.com/api/items/' + itemId;
    var response = await http.delete(Uri.parse(url2));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRouteName.create_items);
          },
          child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text("Data Asset Perusahaan"),
      ),
      body: FutureBuilder(
        future: getItems(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data['data'].length,
            itemBuilder: (((context, index) {
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data['data'][index]['name'],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailItem(
                                                item: snapshot.data['data']
                                                    [index])));
                                  },
                                  child: Icon(Icons.details_outlined)),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditItemScreen(
                                                  item: snapshot.data['data']
                                                      [index],
                                                )));
                                  },
                                  child: Icon(Icons.edit)),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    deleteItem(snapshot.data['data'][index]
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
                        ],
                      ),
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
