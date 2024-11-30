import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onToggleTheme; // Callback untuk toggle dark/light mode
  final VoidCallback onRefresh; // Callback untuk tombol refresh
  final bool isDarkMode; // Status dark mode

  const CustomHeader({super.key, 
    required this.onToggleTheme,
    required this.onRefresh,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.teal,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo dan Teks
          Row(
            children: [
              Image.asset(
                'assets/images/geger-logo-final.png',
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported, color: Colors.white, size: 40);
                },
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Geger",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Earthquake Monitor",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Ikon Dark/Light Mode dan Refresh
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                tooltip: "Refresh Data",
                onPressed: onRefresh,
              ),
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
                tooltip: "Toggle Theme",
                onPressed: onToggleTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
