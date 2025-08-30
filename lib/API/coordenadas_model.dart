class CoordenadasModel {
  double latitude;
  double longitude;
  CoordenadasModel({required this.latitude, required this.longitude});

  @override
  String toString() {
    return 'Latitude: $latitude, Longitude: $longitude';
  }
}
