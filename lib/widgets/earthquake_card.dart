import 'package:flutter/material.dart';
import '../models/earthquake_model.dart';
import '../screens/detail_screen.dart';

class EarthquakeCard extends StatelessWidget {
  final Earthquake earthquake;

  const EarthquakeCard({required this.earthquake});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Mendapatkan tema aktif

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(earthquake: earthquake),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: theme.cardColor, // Warna card mengikuti tema
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.brightness == Brightness.dark
                ? Colors.teal.withOpacity(0.3) // Warna border untuk mode gelap
                : Colors.grey.withOpacity(0.3), // Warna border untuk mode terang
          ),
          boxShadow: [
            if (theme.brightness == Brightness.light)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lokasi Gempa
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.teal,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      earthquake.place,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Magnitudo
              Row(
                children: [
                  Text(
                    "Magnitude: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                  Text(
                    earthquake.magnitude.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: earthquake.magnitude >= 5.0
                          ? Colors.orange
                          : Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Waktu Gempa
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: theme.brightness == Brightness.dark
                        ? Colors.grey[500]
                        : Colors.grey,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    earthquake.time,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
