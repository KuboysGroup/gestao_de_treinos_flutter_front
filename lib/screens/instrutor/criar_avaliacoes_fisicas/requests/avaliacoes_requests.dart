import 'dart:convert';

import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:http/http.dart' as http;

class AvaliacoesRequests {
  static Future<List<AvaliacaoFisica>> getAvaliacoes(int id) async {
    try {
      var response = await ApiRest().get('/avaliacao-fisica/instrutor/$id');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body
            .map((dynamic item) => AvaliacaoFisica.fromJson(item))
            .toList();
      } else {
        throw Exception('Falha ao carregar avaliações exercícios');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Usuario>> getUsuario() async {
    try {
      var response = await ApiRest().get('/usuario');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Usuario.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar avaliações exercícios');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> registrarAvaliacao(Map<String, dynamic> avaliacao) async {
    var response = await ApiRest().post('/avaliacao-fisica', avaliacao);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return 200;
    } else {
      return 500;
    }
  }

  static Future<int> excluirAvaliacao(int id) async {
    var response = await ApiRest().delete('/avaliacao-fisica/$id');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return 200;
    } else {
      return 500;
    }
  }

  static http.Response _decodeResponse(http.Response response) {
    var decodedBody = utf8.decode(response.bodyBytes);
    return http.Response(decodedBody, response.statusCode,
        headers: response.headers);
  }
}
