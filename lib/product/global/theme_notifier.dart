import 'package:flutter/material.dart';
import 'package:flutter_101/202/theme/light_theme_data.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme ? LightTheme().theme : ThemeData.dark();
}
