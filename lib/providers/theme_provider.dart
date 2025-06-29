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
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF152e1a),
      elevation: 0,
    ),
    cardColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Color(0xFF152e1a),
      surface: Colors.white,
      background: Colors.grey[50]!,
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF152e1a),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[850],
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: Colors.grey[800],
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF152e1a),
      surface: Colors.grey[800]!,
      background: Colors.grey[900]!,
    ),
  );
}
