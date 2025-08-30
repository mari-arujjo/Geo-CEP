import 'package:geo_cep/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';

class TextBoxWidget extends StatefulWidget {
  final TextEditingController? controller;
  const TextBoxWidget({super.key, this.controller});

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Cores().verdeEscuro,
      maxLength: 8,
      keyboardType: TextInputType.number,
      inputFormatters: [MaskedInputFormatter('########')],
      decoration: InputDecoration(
        filled: true,
        fillColor: Cores().verdeClaro,
        hintText: '00000000',
        hintStyle: TextStyle(color: Cores().verdeEscuro),
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
