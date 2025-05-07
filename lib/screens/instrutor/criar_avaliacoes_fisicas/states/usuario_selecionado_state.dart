import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuario_selecionado_state.g.dart';

@riverpod
class UsuarioSelecionadoState extends _$UsuarioSelecionadoState {
  @override
  Usuario? build() {
    return null;
  }

  void selecionarUsuario(Usuario usuario) {
    state = usuario;
  }
}
