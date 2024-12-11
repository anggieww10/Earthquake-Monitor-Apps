import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onToggleTheme; // Callback untuk toggle dark/light mode
  final VoidCallback onRefresh; // Callback untuk tombol refresh
  final bool isDarkMode; // Status dark mode

  const CustomHeader({
    super.key,
    required this.onToggleTheme,
    required this.onRefresh,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final backgroundColor = theme.colorScheme.primary; // Warna latar belakang
    final shadowColor = isDarkMode ? Colors.black.withOpacity(0.5) : Colors.grey.withOpacity(0.2);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 4),
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
                  return Icon(
                    Icons.image_not_supported,
                    color: theme.colorScheme.onPrimary,
                    size: 40,
                  );
                },
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Geger",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  Text(
                    "Earthquake Monitor",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.7),
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
                  color: theme.colorScheme.onPrimary,
                ),
                tooltip: "Refresh Data",
                onPressed: onRefresh,
              ),
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: theme.colorScheme.onPrimary,
                ),
                tooltip: isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode",
                onPressed: onToggleTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
