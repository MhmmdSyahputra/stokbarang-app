import 'package:aplikasi/providers/UsersProviders.dart';
import 'package:aplikasi/screens/bottomnavigation/homepage_view.dart';
import 'package:aplikasi/screens/menuitem/about_view.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const routeName = "/settingsPage";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchVal = false;

  @override
  Widget build(BuildContext context) {
    final provIdUser = Provider.of<UsersProvider>(context);
    final user = Provider.of<UsersProvider>(context).getUser(provIdUser.id);

    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: ColorPalette.primaryColor,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, HomePage.routeName);
              },
            )),
        body: Container(
          child: ListView(
            children: [
              ListTile(
                title: Text("My Account"),
                trailing: Text('${user.username}'),
                tileColor: Colors.grey,
                textColor: Color.fromARGB(251, 91, 94, 95),
                iconColor: Color.fromARGB(251, 91, 94, 95),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Account"),
                trailing: Icon(Icons.arrow_forward),
                textColor: Color.fromARGB(251, 91, 94, 95),
                iconColor: Color.fromARGB(251, 91, 94, 95),
                onTap: () {
                  Navigator.pushNamed(context, "/profilePage");
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Your Number"),
                trailing: Icon(Icons.arrow_forward),
                textColor: Color.fromARGB(251, 91, 94, 95),
                iconColor: Color.fromARGB(251, 91, 94, 95),
                onTap: () {},
              ),
              ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notification"),
                  textColor: Color.fromARGB(251, 91, 94, 95),
                  iconColor: Color.fromARGB(251, 91, 94, 95),
                  trailing: Switch(
                      value: switchVal,
                      activeColor: ColorPalette.primaryColor,
                      onChanged: (bool val) {
                        setState(() {
                          switchVal = val;
                          print(switchVal);
                        });
                      })),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About Us"),
                textColor: Color.fromARGB(251, 91, 94, 95),
                iconColor: Color.fromARGB(251, 91, 94, 95),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Sign Out"),
                textColor: Color.fromARGB(251, 91, 94, 95),
                iconColor: Color.fromARGB(251, 91, 94, 95),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            ],
          ),
        ));
  }
}
