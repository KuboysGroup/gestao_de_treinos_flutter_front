import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/states/usuario_state.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_rest_state.g.dart';

@riverpod
ApiRest apiRestState(Ref ref) {
  final Usuario? usuario =
      ref.watch(usuarioStateProvider).unwrapPrevious().valueOrNull;
  if (usuario == null) {
    return ApiRest();
  } else {
    return ApiRest();
  }
}
