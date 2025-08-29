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
      cursorColor: const Color.fromARGB(190, 113, 216, 117),
      maxLength: 9,
      keyboardType: TextInputType.number,
      inputFormatters: [MaskedInputFormatter('#####-###')],
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 230, 248, 188),
        hintText: '00000-000',
        hintStyle: TextStyle(color: Colors.green),
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
