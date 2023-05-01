import 'package:flutter/material.dart';

class AddToCart with ChangeNotifier {
  int index = 6;
  List<bool> _isTapped = List.generate(7, (index) => false, growable: true);

  // getter
  bool isTapped(index) {
    return _isTapped[index];
  }

  // setter
  void toggleTapped(index) {
    _isTapped[index] = !_isTapped[index];
    notifyListeners();
  }
}
