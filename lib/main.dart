import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/earthquake_provider.dart';
import './screens/home_screen.dart';
import './themes/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EarthquakeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // State untuk tema

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Ubah status tema
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: HomeScreen(
        isDarkMode: isDarkMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}
