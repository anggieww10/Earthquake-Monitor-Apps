import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/earthquake_model.dart';

class ApiService {
  // Update URL untuk mengambil  data berapa gempa
  final String apiUrl = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&orderby=time&limit=100';

  Future<List<Earthquake>> fetchEarthquakes() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Mengambil data gempa dari "features" dan mengubahnya menjadi list of Earthquake
      return (data['features'] as List).map((e) => Earthquake.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load earthquakes");
    }
  }
}
