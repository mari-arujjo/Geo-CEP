import 'dart:convert';
import 'package:geo_cep/API/endereco_model.dart';
import 'package:geo_cep/API/http_client.dart';

class EnderecoRepository {
  final HttpClient client;
  EnderecoRepository({required this.client});

  Future<EnderecoModel> obterEndereco(String cep) async {
    if (cep.isEmpty || cep.length != 8) {
      throw Exception('CEP inválido');
    }
    final response = await client.get(
      url: 'https://viacep.com.br/ws/$cep/json/',
    );
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return EnderecoModel.fromMap(body);
    } else {
      throw Exception('ERRO: ${response.statusCode}');
    }
  }
}
