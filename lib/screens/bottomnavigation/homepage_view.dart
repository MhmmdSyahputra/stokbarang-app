import 'package:aplikasi/data/data.dart';
import 'package:aplikasi/screens/log_reg/login_view.dart';
import 'package:aplikasi/screens/product/productPage.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/constants.dart';
import 'package:aplikasi/screens/bottomnavigation/profile_view.dart';
import 'package:aplikasi/screens/menuitem/settings_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = "/homePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
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
              const PopupMenuItem(
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Image Sliders.png'))),
              ),
            ),
            Column(
              children: listCategory.map((data) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductPage(data: data))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(data['gambar']))),
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                'Data Kategori',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorPalette.textColor),
                              ),
                              Text(
                                '${data['namaCate']}',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ColorPalette.textColor),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      )),
    );
  }

  Widget _imageSlider() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        'assets/images/Image Sliders.png',
        width: 298,
        height: 109,
        fit: BoxFit.cover,
      ),
    );
  }
}
