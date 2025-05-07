import 'dart:convert';

import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:http/http.dart' as http;

class TreinosResquests {
  static Future<List<Treino>> getTreinos(int id) async {
    try {
      var response = await ApiRest().get('/treino/aluno/$id');
      if (response.statusCode == 200) {
        response = _decodeResponse(response);
        List<dynamic> body = json.decode(response.body);
        return body.map((dynamic item) => Treino.fromJson(item)).toList();
      } else {
        throw Exception('Falha ao carregar avaliações exercícios');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // static Future<List<GrupoMuscular>> getGrMuscular() async {
  //   try {
  //     var response = await ApiRest().get('/grupo-muscular');
  //     if (response.statusCode == 200) {
  //       response = _decodeResponse(response);
  //       List<dynamic> body = json.decode(response.body);
  //       return body
  //           .map((dynamic item) => GrupoMuscular.fromJson(item))
  //           .toList();
  //     } else {
  //       throw Exception('Falha ao carregar avaliações exercícios');
  //     }
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // static Future<int> registrarExercicio(Exercicio exercicio) async {
  //   var response = await ApiRest().post('/exercicio', exercicio);
  //   if (response.statusCode >= 200 && response.statusCode < 300) {
  //     return 200;
  //   } else {
  //     return 500;
  //   }
  // }

  // static Future<int> excluirExercicio(int id) async {
  //   var response = await ApiRest().delete('/exercicio/$id');

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
