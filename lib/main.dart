import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/earthquake_provider.dart';
import './providers/theme_provider.dart';
import './screens/home_screen.dart';
import './themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EarthquakeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            // Tambahkan route lain di sini jika perlu
          },
        );
      },
    );
  }
}
