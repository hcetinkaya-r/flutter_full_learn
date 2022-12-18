import 'package:flutter/material.dart';

class LightTheme {
  final _LightColor _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(

      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(headline4: TextStyle(fontSize: 50, color: _lightColor.textColor)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blueAccent,
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(onPrimary: Colors.purple, onSecondary: _lightColor.orangeColor),
      ),
      checkboxTheme:
          CheckboxThemeData(fillColor: MaterialStateProperty.all(Colors.green), side: const BorderSide(color: Colors.green)),
      colorScheme: const ColorScheme.light(
        background: Colors.orange,
      ),
    );
  }
}

class _LightColor {
  final Color textColor = Colors.blue;
  final Color orangeColor = Colors.orange;
}
