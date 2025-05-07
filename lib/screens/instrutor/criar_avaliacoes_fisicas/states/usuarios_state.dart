import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/requests/avaliacoes_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuarios_state.g.dart';

@riverpod
class UsuariosState extends _$UsuariosState {
  @override
  Future<List<Usuario>> build() async {
    return await AvaliacoesRequests.getUsuario();
  }

  void removerAvaliacao(int id) {
    state = state.whenData((avaliacoes) {
      return avaliacoes.where((avaliacao) => avaliacao.id != id).toList();
    });
  }
}
