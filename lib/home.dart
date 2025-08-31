import 'package:flutter/foundation.dart';
import 'package:geo_cep/API/endereco_repository.dart';
import 'package:geo_cep/API/http_client.dart';
import 'package:geo_cep/API/nominatim_repository.dart';
import 'package:geo_cep/cores.dart';
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
  final nominatimRepository = NominatimRepository(client: HttpClient());
  final TextEditingController cepController = TextEditingController();
  final double latitude = -5.8119077;
  final double longitude = -35.2045234;
  LatLng _latLngAtual = LatLng(-5.8119077, -35.2045234);
  final cor = Cores();
  String enderecoFormatado = '';

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        try {
                          if (cepController.text.isEmpty ||
                              cepController.text.length != 8 ||
                              int.tryParse(cepController.text) == null) {
                            throw ('CEP inválido.');
                          }
                          final endereco = await enderecoRepository
                              .obterEndereco(cepController.text);
                          final coordenadas = await nominatimRepository
                              .obterCoordenadas(endereco);
                          if (endereco.logradouro == '' &&
                              endereco.complemento == '' &&
                              endereco.bairro == '' &&
                              endereco.localidade == '' &&
                              endereco.estado == '') {
                            throw ('Não foi possível obter todas as informações do endereço.');
                          }
                          setState(() {
                            _latLngAtual = LatLng(
                              coordenadas.latitude,
                              coordenadas.longitude,
                            );
                          });
                          mapController.move(_latLngAtual, 12);
                          enderecoFormatado =
                              '• Logradouro: ${endereco.logradouro}\n• Complemento: ${endereco.complemento}\n• Bairro: ${endereco.bairro}\n• Cidade: ${endereco.localidade}\n• UF: ${endereco.estado} - Brasil';
                          if (kDebugMode) {
                            print(
                              '${endereco.logradouro}, ${endereco.complemento}, ${endereco.bairro}, ${endereco.localidade}, ${endereco.estado} - Brasil',
                            );
                            print(_latLngAtual);
                          }
                        } catch (e) {
                          if (kDebugMode) {
                            print("Chamou popup >>> $e");
                          }
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Atenção!'),
                                content: Text(e.toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(color: cor.verdeEscuro),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
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
              SizedBox(height: 10),
              Text(enderecoFormatado),
            ],
          ),
        ),
      ),
    );
  }
}
