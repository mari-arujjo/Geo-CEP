import 'package:flutter/foundation.dart';
import 'package:geo_cep/API/endereco_repository.dart';
import 'package:geo_cep/API/http_client.dart';
import 'package:geo_cep/API/nominatim_repositry.dart';
import 'package:geo_cep/widgets/button.dart';
import 'package:geo_cep/widgets/mapa.dart';
import 'package:geo_cep/widgets/textBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MapController mapController = MapController();
  final enderecoRepository = EnderecoRepository(client: HttpClient());
  final nominatimRepository = NominatimRepositry(client: HttpClient());
  final TextEditingController cepController = TextEditingController();
  final double latitude = -5.8119077;
  final double longitude = -35.2045234;
  LatLng _latLngAtual = LatLng(-5.8119077, -35.2045234);

  @override
  void dispose() {
    super.dispose();
    cepController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', width: 120),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Insira o CEP:', style: TextStyle(fontSize: 16)),
                        TextBoxWidget(controller: cepController),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: BotaoWidget(
                      onPressed: () async {
                        final endereco = await enderecoRepository.obterEndereco(
                          cepController.text,
                        );
                        final coordenadas = await nominatimRepository
                            .obterCoordenadas(endereco);
                        setState(() {
                          _latLngAtual = LatLng(
                            coordenadas.latitude,
                            coordenadas.latitude,
                          );
                        });
                        mapController.move(_latLngAtual, 12);
                        if (kDebugMode) {
                          print(endereco);
                          print(coordenadas);
                          print(_latLngAtual);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Mapa(controller: mapController, latLong: _latLngAtual),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
