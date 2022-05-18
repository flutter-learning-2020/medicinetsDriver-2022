import 'package:flutter/material.dart';
import 'package:medicinetsdriver/models/user_model.dart';

class UserDataProvider with ChangeNotifier {
  User? userData;
  UserDataProvider({this.userData});

  set userDataPro(User data) {
    this.userData = data;
    notifyListeners();
  }
}
