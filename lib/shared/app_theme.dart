import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Colors.white, // Warna card untuk mode terang
      appBarTheme: AppBarTheme(
        color: Colors.teal,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.grey[900],
      cardColor: Colors.grey[850], // Warna card untuk mode gelap
      appBarTheme: AppBarTheme(
        color: Colors.grey[850],
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
