import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaDart extends StatefulWidget {
  const MapaDart({super.key});

  @override
  State<MapaDart> createState() => _MapaDartState();
}

class _MapaDartState extends State<MapaDart> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialCenter: LatLng(-5.8119077, -35.2045234)),
      children: [

      ]
    );
  }
}
