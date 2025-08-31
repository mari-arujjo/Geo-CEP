class CoordenadasModel {
  double latitude;
  double longitude;
  CoordenadasModel({required this.latitude, required this.longitude});

  factory CoordenadasModel.fromMap(Map<String, dynamic> map) {
    return CoordenadasModel(
      latitude: double.parse(map['lat'].toString()),
      longitude: double.parse(map['lon'].toString()),
    );
  }
  
}
