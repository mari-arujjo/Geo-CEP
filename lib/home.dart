import 'package:geo_cep/API/endereco_model.dart';
import 'package:geo_cep/API/endereco_repository.dart';
import 'package:geo_cep/API/http_client.dart';
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
  final repository = EnderecoRepository(client: HttpClient());
  final TextEditingController cepController = TextEditingController();
  final double latitude = -5.8119077;
  final double longitude = -35.2045234;

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
          padding: EdgeInsets.all(30),
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
                        var req = await repository.obterEndereco(
                          cepController.text,
                        );
                        final endereco =
                            '${req.cep}, ${req.logradouro}, ${req.complemento}, ${req.unidade}, ${req.bairro}, ${req.localidade}, ${req.uf}, ${req.estado}, ${req.regiao}, ${req.ibge}, ${req.gia}, ${req.ddd}, ${req.siafi}';
                        //print(endereco);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Mapa(
                  controller: mapController,
                  latLong: LatLng(latitude, longitude),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
