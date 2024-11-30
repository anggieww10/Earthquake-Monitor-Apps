import 'package:flutter/material.dart';
import '../models/earthquake_model.dart';
import '../services/api_service.dart';
import 'package:logger/logger.dart';  // Import Logger

class EarthquakeProvider with ChangeNotifier {
  List<Earthquake> _earthquakes = [];
  List<Earthquake> _filteredEarthquakes = [];
  bool _isLoading = false;

  final Logger _logger = Logger();  // Instance dari Logger

  List<Earthquake> get earthquakes => _filteredEarthquakes;
  bool get isLoading => _isLoading;

  // Fetch data dari API
  Future<void> fetchEarthquakes() async {
    _isLoading = true;
    notifyListeners(); // Beritahu UI untuk menampilkan loading spinner
    try {
      final fetchedData = await ApiService().fetchEarthquakes();
      _earthquakes = fetchedData;
      _filteredEarthquakes = fetchedData; // Default: semua data ditampilkan
    } catch (e) {
      _logger.e("Error fetching earthquakes: $e");  // Gunakan logger untuk mencatat error
    } finally {
      _isLoading = false;
      notifyListeners(); // Beritahu UI bahwa data telah diperbarui
    }
  }

  // Logika pencarian
  void searchEarthquakes(String query) {
    if (query.isEmpty) {
      _filteredEarthquakes = _earthquakes; // Semua data jika query kosong
    } else {
      _filteredEarthquakes = _earthquakes
          .where((quake) => quake.place.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners(); // Beritahu UI untuk refresh data
  }

  void toggleTheme() {}
}
