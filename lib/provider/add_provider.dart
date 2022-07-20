import 'package:flutter/material.dart';

class AddProvider extends ChangeNotifier {
  bool added = false;
  add() {
    added = !added;
    notifyListeners();
  }
}
