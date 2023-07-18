import 'package:aplikasi/screens/bottomnavigation/homepage_view.dart';
import 'package:aplikasi/screens/bottomnavigation/stockandinventorypage_view.dart';
import 'package:aplikasi/screens/bottomnavigation/reportspage_view.dart';
import 'package:aplikasi/screens/bottomnavigation/productdetailspage_view.dart';
import 'package:aplikasi/screens/bottomnavigation/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/constants.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});
  static const routeName = "/homePage";

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  List index = [
    HomePage(),
    StockandInventoryPage(),
    ReportsPage(),
    ProfilePage()
  ];
  int params = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: index[params],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: params,
          onTap: (e) {
            setState(() {
              params = e;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shelves),
              label: 'Stock and Inventory',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
          backgroundColor: ColorPalette.underlineTextField,
          selectedItemColor: ColorPalette.primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
        ));
  }
}
