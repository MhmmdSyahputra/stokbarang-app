import 'package:aplikasi/providers/UsersProviders.dart';
import 'package:aplikasi/screens/index_screen.dart';
import 'package:aplikasi/screens/log_reg/register_view.dart';
import 'package:aplikasi/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/screens/activation_view.dart';
import 'package:aplikasi/screens/bottomnavigation/profile_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UsersProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Sansita'),
      title: "Manajemen Stock Gudang",
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        RegisterPage.routeName: (context) => RegisterPage(),
        IndexScreen.routeName: (context) => const IndexScreen(),
        Activation.routeName: (context) => Activation(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    ),
  ));
}
