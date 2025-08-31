import 'dart:convert';
import 'dart:io';

import 'package:geo_cep/API/coordenadas_model.dart';
import 'package:geo_cep/API/endereco_model.dart';
import 'package:geo_cep/API/http_client.dart';

class NominatimRepository {
  final HttpClient client;
  NominatimRepository({required this.client});

  Future<CoordenadasModel> obterCoordenadas(EnderecoModel endereco) async {
    final String enderecoCompleto =
        '${endereco.logradouro}, ${endereco.complemento}, ${endereco.bairro}, ${endereco.localidade}, ${endereco.estado} - Brasil';
    final String enderecoQuery = Uri.encodeComponent(enderecoCompleto);
    try {
      final response = await client.getWithHeader(
        url:
            'https://nominatim.openstreetmap.org/search?q=$enderecoQuery&format=json&limit=1',
        headers: {'User-Agent': 'geo_cep_app (mariana.estudo9889@gmail.com)'},
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        if (body.isNotEmpty) {
          final data = body[0] as Map<String, dynamic>;
          final lat = double.parse(data['lat']);
          final lon = double.parse(data['lon']);
          return CoordenadasModel(latitude: lat, longitude: lon);
        } else {
          throw ('Endereço não encontrado pelo Nominatim.');
        }
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
