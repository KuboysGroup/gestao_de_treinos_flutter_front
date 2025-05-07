import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:http/http.dart' as http;

class CadastroRequests {
  static Future<int> cadastrarRetirada(Usuario usuario,
      {required ApiRest apiRest}) async {
    try {
      http.Response responseBody =
          await apiRest.authenticate('usuario', usuario);
      if (responseBody.statusCode >= 200 && responseBody.statusCode < 300) {
        return 200;
      } else {
        return 500;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
