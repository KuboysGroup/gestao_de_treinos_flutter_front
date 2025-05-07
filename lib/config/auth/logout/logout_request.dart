import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';

Future<void> logoutRequest({required ApiRest networkClient}) async {
  return networkClient.authenticate('rest/logout');
}
