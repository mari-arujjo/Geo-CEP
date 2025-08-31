import 'package:geo_cep/cores.dart';
import 'package:flutter/material.dart';

class BotaoSearchWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const BotaoSearchWidget({super.key, required this.onPressed});

  @override
  State<BotaoSearchWidget> createState() => _BotaoSearchWidgetState();
}

class _BotaoSearchWidgetState extends State<BotaoSearchWidget> {
  final cores = Cores();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(cores.verdeEscuro),
        overlayColor: WidgetStatePropertyAll<Color>(cores.verdeClaro),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
      child: Icon(Icons.search, color: Colors.white, size: 20),
    );
  }
}
