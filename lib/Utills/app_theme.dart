import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define the light theme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      bodyMedium: GoogleFonts.roboto(
        fontSize: 16.0,
        color: Colors.black87,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurple,
      ),
    ),
    useMaterial3: true,
  );
}
