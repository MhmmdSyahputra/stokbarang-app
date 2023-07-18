import 'package:aplikasi/data/data.dart';
import 'package:aplikasi/screens/log_reg/login_view.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/constants.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi/screens/bottomnavigation/profile_view.dart';
import 'package:aplikasi/screens/menuitem/settings_view.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reports',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorPalette.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'item1') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              } else if (value == 'item2') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              } else if (value == 'item3') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: const Text(
                  'Profile',
                  style: TextStyle(color: Color.fromARGB(251, 91, 94, 95)),
                ),
                value: 'item1',
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                child: Text(
                  'Settings',
                  style: TextStyle(color: Color.fromARGB(251, 91, 94, 95)),
                ),
                value: 'item2',
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Color.fromARGB(251, 91, 94, 95)),
                ),
                value: 'item3',
              ),
              //tambahkan menu disini
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: listProduct.map((data) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 6,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            '${data['namaProduct']}',
                            style: TextStyle(color: ColorPalette.primaryColor),
                          )),
                          Expanded(
                              child: Text(
                            '${data['namaProduct']}',
                            style: TextStyle(color: ColorPalette.primaryColor),
                          )),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text('Sold'),
                              Row(
                                children: [
                                  Icon(
                                    Icons.fire_truck,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '${data['stok']} Items',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorPalette.primaryColor),
                                  )
                                ],
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text('Stok'),
                              Row(
                                children: [
                                  Icon(
                                    Icons.inventory,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    '${data['stok']} Items',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: ColorPalette.primaryColor),
                                  )
                                ],
                              ),
                            ],
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
