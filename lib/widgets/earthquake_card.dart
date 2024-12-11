import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format waktu
import '../models/earthquake_model.dart';
import '../screens/detail_screen.dart';

class EarthquakeCard extends StatelessWidget {
  final Earthquake earthquake;

  const EarthquakeCard({super.key, required this.earthquake});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Mendapatkan tema aktif

    // Variabel untuk styling
    final textColor = theme.textTheme.bodyMedium?.color;
    final cardColor = theme.cardColor;
    final borderColor = theme.brightness == Brightness.dark
        ? Colors.teal.withOpacity(0.3)
        : Colors.grey.withOpacity(0.3);
    final shadowColor = theme.brightness == Brightness.light
        ? Colors.grey.withOpacity(0.2)
        : Colors.transparent;

    // Format waktu dari DateTime ke String
    final formattedTime = DateFormat('EEEE, MMM d, yyyy hh:mm a').format(earthquake.time);

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
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor),
          boxShadow: [
            if (shadowColor != Colors.transparent)
              BoxShadow(
                color: shadowColor,
                blurRadius: 8,
                offset: const Offset(0, 4),
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
                  const Icon(
                    Icons.location_on,
                    color: Colors.teal,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
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
              const SizedBox(height: 10),

              // Magnitudo
              Row(
                children: [
                  Text(
                    "Magnitude: ",
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
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
              const SizedBox(height: 10),

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
                  const SizedBox(width: 8),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
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
