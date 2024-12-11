class Earthquake {
  
  final String place;
  final double magnitude;
  final DateTime time;

  Earthquake({
    required this.place,
    required this.magnitude,
    required this.time,
  });

  /// Membuat instance Earthquake dari JSON
  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      place: json['properties']['place'] ?? 'Unknown Location',
      magnitude: (json['properties']['mag'] ?? 0.0).toDouble(),
      time: DateTime.fromMillisecondsSinceEpoch(
        json['properties']['time'] ?? 0,
        isUtc: true,
      ),
    );
  }
}
