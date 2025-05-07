import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/requests/associar_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuarios_state.g.dart';

@riverpod
class UsuariosState extends _$UsuariosState {
  @override
  Future<List<Usuario>> build() async {
    return await AssociarRequests.getUsuarios();
  }

  void removerTreinoDoUsuario({required int usuarioId, required int treinoId}) {
    state = state.whenData((usuarios) {
      return usuarios.map((usuario) {
        if (usuario.id == usuarioId) {
          final novaListaTreinos =
              usuario.treinos.where((treino) => treino.id != treinoId).toList();
          return usuario.copyWith(treinos: novaListaTreinos);
        }
        return usuario;
      }).toList();
    });
  }

  void adicionarTreinoAoUsuario(
      {required int usuarioId, required Treino treinoNovo}) {
    state = state.whenData((usuarios) {
      return usuarios.map((usuario) {
        if (usuario.id == usuarioId) {
          final treinosAtualizados = [...usuario.treinos, treinoNovo];
          return usuario.copyWith(treinos: treinosAtualizados);
        }
        return usuario;
      }).toList();
    });
  }
}
