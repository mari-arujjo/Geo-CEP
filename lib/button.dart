import 'package:av5devmoveis/cores.dart';
import 'package:flutter/material.dart';

class BotaoWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const BotaoWidget({super.key, required this.onPressed});

  @override
  State<BotaoWidget> createState() => _BotaoWidgetState();
}

class _BotaoWidgetState extends State<BotaoWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Cores().verdeEscuro),
        overlayColor: WidgetStatePropertyAll<Color>(Cores().verdeClaro),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
      child: Icon(Icons.search, color: Colors.white, size: 20),
    );
  }
}
