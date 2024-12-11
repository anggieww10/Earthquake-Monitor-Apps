import 'package:flutter/material.dart';
import '../themes/app_theme.dart'; // Import AppTheme untuk tema aplikasi

class ThemeProvider with ChangeNotifier {
  /// Status tema, default adalah light mode
  bool _isDarkMode = false;

  /// Mengambil status dark mode
  bool get isDarkMode => _isDarkMode;

  /// Mendapatkan tema saat ini berdasarkan status dark mode
  ThemeData get currentTheme => _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

  /// Toggle tema antara light mode dan dark mode
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Memberitahukan widget untuk merender ulang
  }

  /// Mengatur dark mode secara langsung
  void setDarkMode(bool value) {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      notifyListeners();
    }
  }
}
