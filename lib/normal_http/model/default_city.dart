class DefaultCity {
  final String name;
  final double lat;
  final double lon;

  const DefaultCity({
    required this.name,
    required this.lat,
    required this.lon,
  });
}

// List of famous cities as a constant
List<DefaultCity> famousCities = const [
  DefaultCity(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
  DefaultCity(name: 'New Delhi', lat: 28.5833, lon: 77.2),
  DefaultCity(name: 'Paris', lat: 48.85, lon: 2.3333),
  DefaultCity(name: 'London', lat: 51.4833, lon: -0.0833),
  DefaultCity(name: 'New York', lat: 40.7167, lon: -74.0167),
  DefaultCity(name: 'Tehran', lat: 35.6833, lon: 51.4167),
];