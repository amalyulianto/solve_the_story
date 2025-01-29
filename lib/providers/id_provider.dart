import 'package:flutter/material.dart';

class IdProvider extends ChangeNotifier {
  int _currentId = 1;

  int get currentId => _currentId;

  void setId(int id) {
    _currentId = id;
    notifyListeners();
  }
}
