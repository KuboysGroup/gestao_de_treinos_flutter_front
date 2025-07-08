import 'dart:convert';

import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/aluno_treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:http/http.dart' as http;

Future<Usuario> loginRequest(String email, String senha,
    {required ApiRest networkClient}) async {
  final Map<String, String> body = {
    'email': email,
    'senha': senha,
  };
  http.Response responseBody =
      await networkClient.authenticate('usuario/login', body);
  Usuario usuario = Usuario(
      id: processResponse(responseBody)['id'],
      email: processResponse(responseBody)['email'],
      nome: processResponse(responseBody)['nome'],
      senha: processResponse(responseBody)['senha'],
      dataNascimento: processResponse(responseBody)['dataNascimento'],
      perfil: processResponse(responseBody)['perfil'],
      treinos: (processResponse(responseBody)['treinos'] as List).map((treino) {
        try {
          return AlunoTreino.fromJson(treino);
        } catch (e) {
          print(e);
          throw Exception(e);
        }
      }).toList());

  // print(usuario);
  return usuario;
}

dynamic processResponse(http.Response response) {
  switch (response.statusCode) {
    case < 200:
      return null;
    case >= 200 && < 300:
      if (response.headers['content-type'] == 'application/json') {
        return jsonDecode(response.body);
      } else {
        return response.body;
      }
    case >= 400 && < 500:
      throw response.body;
    case >= 500:
      throw response.body;
    default:
      throw response.body;
  }
}
