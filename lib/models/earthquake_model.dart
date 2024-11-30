class Earthquake {
  final String place;
  final double magnitude;
  final String time;

  Earthquake({
    required this.place,
    required this.magnitude,
    required this.time,
  });

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      place: json['properties']['place'] ?? 'Unknown Location',
      magnitude: json['properties']['mag']?.toDouble() ?? 0.0,
      time: DateTime.fromMillisecondsSinceEpoch(json['properties']['time']).toString(),
    );
  }
}
