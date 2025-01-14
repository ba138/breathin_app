import 'package:flutter/material.dart';

class AppTheme {
  // Define the light theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
    useMaterial3: true,
  );
}
