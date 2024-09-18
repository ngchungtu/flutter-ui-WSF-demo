import 'package:flutter/material.dart';

class ChangeText extends ChangeNotifier {
  String defaultText;
  ChangeText({this.defaultText = 'Hello, Flutter!'});

  void changeText({required String newText}) {
    defaultText = newText;
    notifyListeners();
  }
}
