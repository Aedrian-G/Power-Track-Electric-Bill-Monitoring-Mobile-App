import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  String? email;

  void setEmail(String? newEmail) {
    email = newEmail;
    notifyListeners();
  }
}
