import 'dart:convert';

import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:http/http.dart' as http;

class AvaliacoesRequests {
  static Future<List<AvaliacaoFisica>> getAvaliacoes(String id) async {
    try {
      var response = await ApiRest().get('/avaliacao-fisica/aluno/$id');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body
            .map((dynamic item) => AvaliacaoFisica.fromJson(item))
            .toList();
      } else {
        throw Exception('Falha ao carregar avaliações físicas');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  static http.Response _decodeResponse(http.Response response) {
    var decodedBody = utf8.decode(response.bodyBytes);
    return http.Response(decodedBody, response.statusCode,
        headers: response.headers);
  }
}
