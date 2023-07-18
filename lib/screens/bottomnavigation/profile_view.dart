import 'package:aplikasi/constants.dart';
import 'package:aplikasi/models/userModel.dart';
import 'package:aplikasi/providers/UsersProviders.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/profilePage";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isupdate = false;
  final TextEditingController newUsername = TextEditingController();
  final TextEditingController newEmail = TextEditingController();
  final TextEditingController newPhone = TextEditingController();
  String? genderValue;
  String? dateofBirth;
  ImageProvider? gambar;

  cekNull(text) {
    if (text == null || text == '') {
      return '. . .';
    }
    return text;
  }

  dynamic getProfile(image) {
    if (image != null) {
      return image;
    } else {
      return AssetImage('assets/images/noprofile.png');
    }
  }

  void showSnackbar(BuildContext context, pesan, Color color) {
    final snackBar = SnackBar(
      content: Text('${pesan}'),
      duration: Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        gambar = MemoryImage(bytes);
      });
    }
  }

  @override
  void initState() {
    final provIdUser = Provider.of<UsersProvider>(context, listen: false);
    final user = Provider.of<UsersProvider>(context, listen: false)
        .getUser(provIdUser.id);
    gambar = user.profil;
    newUsername.text = user.username;
    newEmail.text = user.email;
    newPhone.text = user.noHp ?? '';
    genderValue = user.gender ?? 'Male';
    dateofBirth = user.dateOfBirth ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> listGender = ['Male', 'Female', 'Non-Binary'];
    final provIdUser = Provider.of<UsersProvider>(context);
    final user = Provider.of<UsersProvider>(context).getUser(provIdUser.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${isupdate ? 'Update' : 'Profile'}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: ColorPalette.hintColor),
        ),
        backgroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        actions: [
          isupdate
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isupdate = false;
                            });
                          },
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: ColorPalette.textColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: ElevatedButton(
                          onPressed: () {
                            if (newUsername.text != '' && newEmail.text != '') {
                              provIdUser.updateUser(
                                  user.id,
                                  UserModel(
                                      id: user.id,
                                      profil: gambar,
                                      username: newUsername.text,
                                      email: newEmail.text,
                                      noHp: newPhone.text,
                                      gender: genderValue,
                                      dateOfBirth: dateofBirth.toString(),
                                      password: user.password));
                              setState(() {
                                isupdate = false;
                              });
                              showSnackbar(
                                  context,
                                  'Data anda berhasil di edit',
                                  ColorPalette.primaryDarkColor);
                              return;
                            }
                            showSnackbar(
                                context,
                                'Username/Email tidak boleh kosong!',
                                ColorPalette.textColor);
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: ColorPalette.primaryDarkColor,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10))),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isupdate = true;
                        });
                      },
                      child: Text('Update'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: ColorPalette.primaryDarkColor,
                          padding: const EdgeInsets.symmetric(horizontal: 10))),
                )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              isupdate
                  ? Column(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                getFromGallery();
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.1))
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: getProfile(gambar))),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 7, color: Colors.white),
                                          color: Colors.blueGrey),
                                      child: IconButton(
                                        icon: Icon(Icons.camera_alt_rounded),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        new Container(
                          padding: new EdgeInsets.only(
                              top: 20, left: 10, bottom: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: new Center(
                            child: new Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Username',
                                      style: TextStyle(
                                          color: ColorPalette.textColor),
                                    )),
                                    Expanded(
                                        child: TextField(
                                      controller: newUsername,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Username..',
                                      ),
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Email',
                                      style: TextStyle(
                                          color: ColorPalette.textColor),
                                    )),
                                    Expanded(
                                        child: TextField(
                                      controller: newEmail,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email..',
                                      ),
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Phone',
                                      style: TextStyle(
                                          color: ColorPalette.textColor),
                                    )),
                                    Expanded(
                                        child: TextField(
                                      controller: newPhone,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Phone..',
                                      ),
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Gender',
                                      style: TextStyle(
                                          color: ColorPalette.textColor),
                                    )),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.centerRight,
                                            child: DropdownButton<String>(
                                              value: genderValue,
                                              icon: const Icon(
                                                  Icons.arrow_drop_down),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  genderValue = value!;
                                                });
                                              },
                                              items: listGender.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              underline: Container(),
                                            ))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Date Of Birth',
                                      style: TextStyle(
                                          color: ColorPalette.textColor),
                                    )),
                                    Expanded(
                                        child: DateTimePicker(
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                      initialValue: dateofBirth,
                                      timeHintText: 'dateofBirth',
                                      firstDate: DateTime(1000),
                                      lastDate: DateTime(2100),
                                      onChanged: (val) => {dateofBirth = val},
                                      validator: (val) {
                                        dateofBirth = val;
                                        return null;
                                      },
                                      onSaved: (val) => {dateofBirth = val},
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.1))
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: getProfile(user.profil))),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 7, color: Colors.white),
                                        color: Colors.blueGrey),
                                    child: IconButton(
                                      icon: Icon(Icons.camera_alt_rounded),
                                      color: Colors.white,
                                      onPressed: () {},
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        new Container(
                          padding:
                              new EdgeInsets.only(top: 20, left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: new Center(
                            child: new Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Text(
                                    "Username",
                                    style: TextStyle(
                                        color: ColorPalette.textColor),
                                  ),
                                  textColor: ColorPalette.primaryDarkColor,
                                  trailing: Text('${user.username}'),
                                  tileColor: Color(0xFFEEEEEE),
                                ),
                                ListTile(
                                  leading: Text(
                                    "Email",
                                    style: TextStyle(
                                        color: ColorPalette.textColor),
                                  ),
                                  textColor: ColorPalette.primaryDarkColor,
                                  trailing: Text('${user.email}'),
                                  tileColor: Color(0xFFEEEEEE),
                                ),
                                ListTile(
                                  leading: Text(
                                    "Phone",
                                    style: TextStyle(
                                        color: ColorPalette.textColor),
                                  ),
                                  textColor: ColorPalette.primaryDarkColor,
                                  trailing: Text('${cekNull(user.noHp)}'),
                                  tileColor: Color(0xFFEEEEEE),
                                ),
                                ListTile(
                                  leading: Text(
                                    "Gender",
                                    style: TextStyle(
                                        color: ColorPalette.textColor),
                                  ),
                                  textColor: ColorPalette.primaryDarkColor,
                                  trailing: Text('${cekNull(user.gender)}'),
                                  tileColor: Color(0xFFEEEEEE),
                                ),
                                ListTile(
                                  leading: Text(
                                    "Date Of Birth",
                                    style: TextStyle(
                                        color: ColorPalette.textColor),
                                  ),
                                  textColor: ColorPalette.primaryDarkColor,
                                  trailing:
                                      Text('${cekNull(user.dateOfBirth)}'),
                                  tileColor: Color(0xFFEEEEEE),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
