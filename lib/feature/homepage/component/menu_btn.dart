import 'package:flutter/material.dart';
import 'package:sidata/core/route/app_route_name.dart';

class MenuBtn extends StatelessWidget {
  const MenuBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.divisions);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Data Divisi Perusahaan"),
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.employees);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Data Pegawai Perusahaan"),
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.items);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Data Asset Perusahaan"),
              ),
            ),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.inventories);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                child: const Text("Data Inventaris Perusahaan"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
