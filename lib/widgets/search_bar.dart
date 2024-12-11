import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;
  final bool isDarkMode;

  const SearchBar({Key? key, required this.onSearch, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = isDarkMode ? theme.colorScheme.surface : theme.colorScheme.background;
    final iconColor = theme.iconTheme.color;
    final hintColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: "Search Earthquakes...",
          hintStyle: TextStyle(color: hintColor),
          prefixIcon: Icon(
            Icons.search,
            color: iconColor,
          ),
          filled: true,
          fillColor: backgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
