import 'dart:convert';

import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:http/http.dart' as http;

class AssociarRequests {
  static Future<List<Usuario>> getUsuarios() async {
    try {
      var response = await ApiRest().get('/usuario');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Usuario.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar treinos');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

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

  static Future<Usuario> atualizarTreino(
      int id, Map<String, dynamic> usuario) async {
    try {
      var response = await ApiRest().put('/usuario/$id', usuario);
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        dynamic body = json.decode(response.body);
        return Usuario.fromJson(body);
      } else {
        throw Exception('Falha ao carregar avaliações exercícios');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // static Future<int> registrarTreino(Map<String, dynamic> treino) async {
  //   var response = await ApiRest().post('/treino', treino);
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return 200;
  //   } else {
  //     return 500;
  //   }
  // }

  // static Future<int> excluirTreino(int id) async {
  //   var response = await ApiRest().delete('/treino/$id');

  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return 200;
  //   } else {
  //     return 500;
  //   }
  // }

  static http.Response _decodeResponse(http.Response response) {
    var decodedBody = utf8.decode(response.bodyBytes);
    return http.Response(decodedBody, response.statusCode,
        headers: response.headers);
  }
}
