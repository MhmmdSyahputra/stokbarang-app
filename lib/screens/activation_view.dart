import 'package:flutter/material.dart';
import 'package:aplikasi/constants.dart';

class Activation extends StatelessWidget {
  static const routeName = "/activation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconActivation(),
                  _titleDescription(),
                  _buildButton(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconActivation() {
    return Image.asset(
      "assets/images/Image Logo App.png",
      width: 170.0,
      height: 170.0,
    );
  }

  Widget _titleDescription() {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Registrasi Sukses",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.check_circle_outlined,
            color: Colors.white,
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      Text(
        "Wah, kamu berhasil Registrasi akun. Silahkan Login untuk masuk!",
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ]);
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        ElevatedButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey)),
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ],
    );
  }
}
