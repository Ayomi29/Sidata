import 'package:sidata/core/component/app_text_field.dart';
import 'package:sidata/core/route/app_route_name.dart';

import 'package:sidata/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class EditItemScreen extends StatelessWidget {
  const EditItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 100, bottom: 30),
                alignment: Alignment.center,
                child: Text(
                  "Update Data Asset",
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppTextField(
                    prefix: Icon(Icons.person_outline),
                    hint: "Nama Barang",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppTextField(
                    prefix: Icon(Icons.person_outline),
                    hint: "Type Barang",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppTextField(
                    prefix: Icon(Icons.person_outline),
                    hint: "Brand Barang",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppTextField(
                    prefix: Icon(Icons.person_outline),
                    hint: "Purchase Date",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  AppTextField(
                    prefix: Icon(Icons.person_outline),
                    hint: "Keadaan Barang",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(height: 16),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRouteName.items,
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
