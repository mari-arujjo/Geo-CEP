import 'dart:convert';
import 'dart:io';
import 'package:geo_cep/API/model/endereco_model.dart';
import 'package:geo_cep/API/http_client.dart';

class EnderecoRepository {
  final HttpClient client;
  EnderecoRepository({required this.client});

  Future<EnderecoModel> obterEndereco(String cep) async {
    try {
      final response = await client.get(url: 'https://viacep.com.br/ws/$cep/json/');
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      if (body.containsKey('erro')) {
        throw ('CEP $cep inválido. Tente novamente.');
      }

      if (response.statusCode == 200) {
        return EnderecoModel.fromMap(body);
      } else {
        throw ('ERRO: ${response.statusCode}');
      }
      
    } on SocketException {
      throw ('Sem conexão com a internet');
    } catch (e) {
      rethrow;
    }
  }
}
