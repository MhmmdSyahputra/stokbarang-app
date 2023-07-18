import 'package:aplikasi/models/userModel.dart';
import 'package:flutter/material.dart';

class UsersProvider with ChangeNotifier {
  List<UserModel> _usersList = [];

  List<UserModel> get usersList => _usersList;

  void register(UserModel user) {
    _usersList.add(user);
    notifyListeners();
  }

  // Metode untuk mengupdate data user berdasarkan ID
  void updateUser(String id, UserModel updatedUser) {
    final index = _usersList.indexWhere((user) => user.id == id);
    if (index >= 0) {
      _usersList[index] = updatedUser;
      notifyListeners();
    } else {
      throw Exception('User not found');
    }
  }

  String _id = '';
  String get id => _id;

  void userDoLogin(id) {
    _id = id;
    notifyListeners();
  }

  // Metode untuk mendapatkan data user berdasarkan ID
  UserModel getUser(id) {
    return _usersList.firstWhere((user) => user.id == id);
  }
}
