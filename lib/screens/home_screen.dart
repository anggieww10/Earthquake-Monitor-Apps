import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/earthquake_provider.dart';
import '../widgets/earthquake_card.dart';
import '../widgets/custom_header.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode; // Status tema
  final VoidCallback onToggleTheme; // Fungsi untuk toggle tema

  const HomeScreen({super.key, 
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data gempa saat halaman dimuat
    Future.microtask(() =>
        Provider.of<EarthquakeProvider>(context, listen: false).fetchEarthquakes());
  }

  void refreshData() {
    // Fungsi untuk refresh data gempa
    Provider.of<EarthquakeProvider>(context, listen: false).fetchEarthquakes();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Mengambil tema aktif
    final earthquakeProvider = Provider.of<EarthquakeProvider>(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          // Custom Header
          CustomHeader(
            onToggleTheme: widget.onToggleTheme, // Gunakan fungsi dari widget
            onRefresh: refreshData, // Fungsi refresh
            isDarkMode: widget.isDarkMode, // Status tema dari widget
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: TextField(
              onChanged: (query) {
                earthquakeProvider.searchEarthquakes(query);
              },
              decoration: InputDecoration(
                hintText: "Search Earthquakes...",
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.iconTheme.color,
                ),
                filled: true,
                fillColor: widget.isDarkMode ? Colors.grey[800] : Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          // Daftar Gempa
          Expanded(
            child: earthquakeProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : earthquakeProvider.earthquakes.isEmpty
                    ? Center(
                        child: Text(
                          "No results found",
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: earthquakeProvider.earthquakes.length,
                        padding: EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return EarthquakeCard(
                            earthquake: earthquakeProvider.earthquakes[index],
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
