import 'package:geo_cep/API/repository/endereco_repository.dart';
import 'package:geo_cep/API/http_client.dart';
import 'package:geo_cep/API/repository/coordenadas_repository.dart';
import 'package:geo_cep/cores.dart';
import 'package:geo_cep/widgets/button_info.dart';
import 'package:geo_cep/widgets/button_search.dart';
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
  final nominatimRepository = CoordenadasRepository(client: HttpClient());
  final TextEditingController cepController = TextEditingController();
  LatLng _latLngAtual = LatLng(-5.8095244, -35.2038655);
  final cor = Cores();
  String enderecoFormatado = '• Logradouro: Avenida Senador Salgado Filho\n• Bairro: Tirol\n• Cidade: Natal\n• UF: Rio Grande de Norte';

  @override
  void dispose() {
    super.dispose();
    cepController.dispose();
  }

  void pesquisarCep() async {
    try {
      if (cepController.text.isEmpty || cepController.text.length != 8 || int.tryParse(cepController.text) == null) {
        throw ('CEP ${cepController.text} inválido. Tente novamente.');
      }
      final endereco = await enderecoRepository.obterEndereco(cepController.text);
      final coordenadas = await nominatimRepository.obterCoordenadas(endereco);
      setState(() {
        _latLngAtual = LatLng(coordenadas.latitude, coordenadas.longitude);
        enderecoFormatado =
            '• Logradouro: ${endereco.logradouro}\n• Bairro: ${endereco.bairro}\n• Cidade: ${endereco.localidade}\n• UF: ${endereco.estado}';
      });
      mapController.move(_latLngAtual, 12);
      if (endereco.logradouro == '' && endereco.bairro == '' && endereco.localidade == '' && endereco.estado == '') {
        throw ('Não foi possível obter todas as informações do endereço.');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Atenção!'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Ok', style: TextStyle(color: cor.verdeEscuro)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', width: 120),
        centerTitle: true,
        actions: <Widget>[BotaoInfoWidget()],
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
                  Expanded(child: BotaoSearchWidget(onPressed: (pesquisarCep))),
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
