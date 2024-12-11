import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tambahkan intl untuk format waktu
import '../models/earthquake_model.dart';

class DetailScreen extends StatelessWidget {
  final Earthquake earthquake;

  const DetailScreen({super.key, required this.earthquake});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Earthquake Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lokasi Gempa
              Row(
                children: [
                  Icon(Icons.location_on, color: theme.primaryColor, size: 28),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      earthquake.place,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleLarge?.color,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(color: theme.dividerColor, thickness: 1),
              const SizedBox(height: 16),

              // Magnitudo
              Row(
                children: [
                  _buildTag(
                    "Magnitude: ${earthquake.magnitude.toStringAsFixed(1)}",
                    earthquake.magnitude >= 5.0 ? Colors.orange : Colors.green,
                  ),
                  const SizedBox(width: 10),
                  _buildTag(
                    earthquake.magnitude >= 5.0 ? "High Risk" : "Low Risk",
                    earthquake.magnitude >= 5.0 ? Colors.redAccent : Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Waktu Gempa
              Row(
                children: [
                  Icon(Icons.access_time, color: theme.iconTheme.color, size: 24),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat('EEEE, MMM d, yyyy hh:mm a').format(earthquake.time),
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Divider(color: theme.dividerColor, thickness: 1),
              const SizedBox(height: 16),

              // Informasi Tambahan
              const Text(
                "Additional Information:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: theme.brightness == Brightness.dark
                          ? Colors.black.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  "This earthquake was recorded in the region of ${earthquake.place}. "
                  "Please stay alert and follow the safety guidelines.",
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.textTheme.bodyMedium?.color,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
