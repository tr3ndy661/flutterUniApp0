import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData => _isDarkMode ? _darkTheme : _lightTheme;

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF152e1a),
    scaffoldBackgroundColor: Colors.white,
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF152e1a),
    scaffoldBackgroundColor: Colors.grey[900],
  );
}
