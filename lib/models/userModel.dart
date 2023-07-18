import 'package:flutter/material.dart';

class UserModel {
  final String id;
  final ImageProvider? profil;
  final String username;
  final String email;
  final String? noHp;
  final String? gender;
  final String? dateOfBirth;
  final String password;

  UserModel({
    required this.id,
    this.profil,
    required this.username,
    required this.email,
    this.noHp,
    this.gender,
    this.dateOfBirth,
    required this.password,
  });
}
