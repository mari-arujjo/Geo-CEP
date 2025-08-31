import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapa extends StatefulWidget {
  final LatLng latLong;
  final MapController controller;
  const Mapa({super.key, required this.controller, required this.latLong});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 500,
        child: FlutterMap(
          mapController: widget.controller,
          options: MapOptions(
            initialCenter: widget.latLong,
            initialZoom: 10,
            maxZoom: 20,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'geo_cep_app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: widget.latLong,
                  child: Icon(Icons.location_pin, color: Colors.red, size: 50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
