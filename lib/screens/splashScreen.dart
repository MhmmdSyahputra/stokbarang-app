import 'dart:async';

import 'package:aplikasi/constants.dart';
import 'package:aplikasi/screens/log_reg/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: ColorPalette.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitFadingCube(
                  color: ColorPalette.hintColor,
                  size: 150,
                ),
                SizedBox(
                  height: 100,
                ),
                Material(
                    color: Colors.transparent,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Management Stock Gudang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )));
  }
}
