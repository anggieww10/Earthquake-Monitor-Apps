import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/earthquake_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/earthquake_card.dart';
import '../widgets/custom_header.dart';
import '../widgets/search_bar.dart' as custom_widgets;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final earthquakeProvider = Provider.of<EarthquakeProvider>(context, listen: false);
    earthquakeProvider.fetchEarthquakes().catchError((error) {
      print('Error fetching earthquakes: $error');
    });
  }

  void refreshData(BuildContext context) {
    final earthquakeProvider = Provider.of<EarthquakeProvider>(context, listen: false);
    earthquakeProvider.fetchEarthquakes().catchError((error) {
      print('Error refreshing data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          // Header
          CustomHeader(
            onToggleTheme: () {
              final provider = Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme();
            },
            onRefresh: () => refreshData(context),
            isDarkMode: isDarkMode,
          ),

          // Search Bar
          custom_widgets.SearchBar(
            isDarkMode: isDarkMode,
            onSearch: (query) {
              final earthquakeProvider = Provider.of<EarthquakeProvider>(context, listen: false);
              earthquakeProvider.searchEarthquakes(query);
            },
          ),

          // Daftar Gempa
          Consumer<EarthquakeProvider>(
            builder: (context, earthquakeProvider, child) {
              if (earthquakeProvider.isLoading) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (earthquakeProvider.error != null) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          earthquakeProvider.error!,
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => refreshData(context),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (earthquakeProvider.earthquakes.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No results found",
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => refreshData(context),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: earthquakeProvider.earthquakes.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return EarthquakeCard(
                      earthquake: earthquakeProvider.earthquakes[index],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
