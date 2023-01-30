import 'package:flutter/material.dart' show ChangeNotifier, ThemeData;

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme ? ThemeData.light() : ThemeData.dark();
}
