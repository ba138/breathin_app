import 'package:breathin_app/Utills/Resources/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Define the light theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    useMaterial3: false,
  );
}
