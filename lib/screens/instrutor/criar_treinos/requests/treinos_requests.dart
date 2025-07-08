import 'dart:convert';

import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:http/http.dart' as http;

class TreinosRequests {
  static Future<List<Treino>> getTreinos() async {
    try {
      var response = await ApiRest().get('/treino');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Treino.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar treinos');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Exercicio>> getExercicios() async {
    try {
      var response = await ApiRest().get('/exercicio');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Exercicio.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar treinos');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Treino> atualizarTreino(
      String id, Map<String, dynamic> treino) async {
    try {
      var response = await ApiRest().put('/treino/$id', treino);
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        dynamic body = json.decode(response.body);
        return Treino.fromJson(body);
      } else {
        throw Exception('Falha ao carregar avaliações exercícios');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<int> registrarTreino(Map<String, dynamic> treino) async {
    var response = await ApiRest().post('/treino', treino);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return 200;
    } else {
      return 500;
    }
  }

  static Future<int> excluirTreino(String id) async {
    var response = await ApiRest().delete('/treino/$id');

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
