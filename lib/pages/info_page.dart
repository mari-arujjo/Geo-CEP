import 'package:flutter/material.dart';
import 'package:geo_cep/widgets/button_github.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  final String githubUrl = 'https://github.com/mari-arujjo';
  void _launchURL() async {
    final Uri url = Uri.parse(githubUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Não foi possível abrir $githubUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o app', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Este projeto foi desenvolvido como atividade da disciplina de Desenvolvimento para Dispositivos Móveis.', style: TextStyle(fontSize: 15)),
              SizedBox(height: 20),

              Text( 'Endereços', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('A API ViaCEP fornece informações detalhadas sobre endereços no Brasil, como logradouro, bairro, cidade e estado.', style: TextStyle(fontSize: 15)),
              SizedBox(height: 20),

              Text('Coordenadas geográficas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('A API Nominatim fornece a latitude e longitude exatas de um endereço.', style: TextStyle(fontSize: 15)),
              SizedBox(height: 20),

              BotaoGithubWidget(url:(){_launchURL();}),
            ],
          ),
        ),
      ),
    );
  }
}
