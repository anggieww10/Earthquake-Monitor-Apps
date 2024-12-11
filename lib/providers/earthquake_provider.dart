import 'package:flutter/material.dart';
import '../models/earthquake_model.dart';
import '../services/api_service.dart';
import 'package:logger/logger.dart';

class EarthquakeProvider with ChangeNotifier {
  final Logger _logger = Logger();

  List<Earthquake> _earthquakes = [];
  List<Earthquake> _filteredEarthquakes = [];
  bool _isLoading = false;
  String? _error;

  // Getter untuk state
  List<Earthquake> get earthquakes => _filteredEarthquakes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Fetch data dari API
  Future<void> fetchEarthquakes() async {
    // Set loading state
    _setLoading(true);

    try {
      final fetchedData = await ApiService().fetchEarthquakes();
      _earthquakes = fetchedData;
      _filteredEarthquakes = fetchedData;
      _logger.i("Successfully fetched ${fetchedData.length} earthquakes.");
    } catch (e) {
      _setError("Failed to fetch data. Please try again.");
      _logger.e("Error fetching earthquakes: $e");
    } finally {
      _setLoading(false);
    }
  }

  /// Logika pencarian gempa
  void searchEarthquakes(String query) {
    if (_earthquakes.isEmpty) {
      _logger.w("Search attempted with empty earthquake list.");
      return;
    }

    if (query.isEmpty) {
      _filteredEarthquakes = _earthquakes;
    } else {
      _filteredEarthquakes = _earthquakes
          .where((quake) => quake.place.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _logger.i("Found ${_filteredEarthquakes.length} results for query: $query");
    }
    notifyListeners();
  }

  // Private method untuk set loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Private method untuk set error state
  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }
}
