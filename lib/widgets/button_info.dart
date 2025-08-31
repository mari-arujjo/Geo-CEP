import 'package:flutter/material.dart';
import 'package:geo_cep/cores.dart';
import 'package:geo_cep/pages/info_page.dart';

class BotaoInfoWidget extends StatefulWidget {
  const BotaoInfoWidget({super.key});

  @override
  State<BotaoInfoWidget> createState() => _BotaoInfoWidgetState();
}

class _BotaoInfoWidgetState extends State<BotaoInfoWidget> {
  final cores = Cores();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info, color: cores.verdeEscuro, size: 30),
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll<Color>(cores.verdeClaro),
      ),
      onPressed:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => InfoPage()),
        );
      },
    );
  }
}
