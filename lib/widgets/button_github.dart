import 'package:flutter/material.dart';
import 'package:geo_cep/cores.dart';

class BotaoGithubWidget extends StatefulWidget {
  final VoidCallback url;
  const BotaoGithubWidget({super.key, required this.url});

  @override
  State<BotaoGithubWidget> createState() => _BotaoGithubWidgetState();
}

class _BotaoGithubWidgetState extends State<BotaoGithubWidget> {
  final cores = Cores();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll<Color>(cores.verdeClaro),
      ),
      onPressed: (widget.url),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.code, color: cores.verdeEscuro),
          SizedBox(width: 8),
          Text('Acesse meu GitHub', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: cores.verdeEscuro,)),
        ],
      ),
    );
  }
}
