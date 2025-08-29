import 'package:av5devmoveis/textBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/assets/logo.png', width: 100),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Insira o CEP:'),
              TextBoxWidget(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
