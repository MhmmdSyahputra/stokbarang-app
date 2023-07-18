import 'package:aplikasi/models/userModel.dart';
import 'package:aplikasi/providers/UsersProviders.dart';
import 'package:aplikasi/screens/log_reg/login_view.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/constants.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/registerPage";

  final TextEditingController _inputUsername = TextEditingController();
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  final TextEditingController _inputRepeatPassword = TextEditingController();

  void showSnackbar(BuildContext context, pesan, Color color) {
    final snackBar = SnackBar(
      content: Text('${pesan}'),
      duration: Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<UsersProvider>(context);
    var uuid = Uuid();

    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/Image Logo App.png",
                        width: 123.0,
                        height: 165.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                      ),
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      Text(
                        "Belum punya akun? silahkan registrasi terlebih dahulu",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      TextFormField(
                        controller: _inputEmail,
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          icon: Icon(Icons.alternate_email),
                          iconColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                      ),
                      TextFormField(
                        controller: _inputUsername,
                        decoration: const InputDecoration(
                          label: Text(
                            'Username',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          icon: Icon(Icons.account_circle_outlined),
                          iconColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        autofocus: false,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      TextFormField(
                        controller: _inputPassword,
                        decoration: const InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          suffixIcon: Icon(Icons.visibility_outlined),
                          suffixIconColor: Colors.white,
                          icon: Icon(Icons.password),
                          iconColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        autofocus: false,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      TextFormField(
                        controller: _inputRepeatPassword,
                        decoration: const InputDecoration(
                          label: Text(
                            ' Confirm Password',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          suffixIcon: Icon(Icons.visibility_outlined),
                          suffixIconColor: Colors.white,
                          icon: Icon(Icons.password),
                          iconColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        autofocus: false,
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: double.infinity,
                              child: Text(
                                'Register',
                                style:
                                    TextStyle(color: ColorPalette.primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onTap: () {
                              if (_inputUsername.text != '' &&
                                  _inputPassword.text != '' &&
                                  _inputRepeatPassword.text != '') {
                                if (_inputPassword.text !=
                                    _inputRepeatPassword.text) {
                                  showSnackbar(
                                      context,
                                      'Konfirmasi Password tidak sesuai!',
                                      Colors.red);
                                  return;
                                }
                                prov.register(UserModel(
                                  id: uuid.v1(),
                                  username: _inputUsername.text,
                                  email: _inputEmail.text,
                                  password: _inputPassword.text,
                                ));
                                showSnackbar(context,
                                    'Registrasi Akun Berhasil!', Colors.green);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                              } else {
                                showSnackbar(context, 'Harap isi semua field!',
                                    Colors.red);
                              }

                              // Navigator.pushNamed(context, Activation.routeName);
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                          ),
                          Text(
                            'or',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: double.infinity,
                              child: Text(
                                'Login',
                                style:
                                    TextStyle(color: ColorPalette.primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
