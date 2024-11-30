import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black), // Pengganti headline6
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87), // Pengganti subtitle1
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54), // Pengganti bodyText2
    ),
    cardColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), // Pengganti headline6
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70), // Pengganti subtitle1
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white60), // Pengganti bodyText2
    ),
    cardColor: Colors.grey[900],
  );
}
