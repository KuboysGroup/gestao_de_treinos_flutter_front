import 'package:gestao_de_treinos_flutter_front/config/api/api_rest.dart';
import 'package:gestao_de_treinos_flutter_front/config/auth/login/login_request.dart';
import 'package:gestao_de_treinos_flutter_front/config/auth/logout/logout_request.dart';
import 'package:gestao_de_treinos_flutter_front/config/auth/usuario/persistence/usuario_persistence.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usuario_state.g.dart';

@riverpod
class UsuarioState extends _$UsuarioState {
  @override
  Future<Usuario?> build() async {
    return await UsuarioPersistence.read();
  }

  Future<void> attemptLogin(String email, String senha) async {
    final Usuario usuario =
        await loginRequest(email, senha, networkClient: ApiRest());
    await UsuarioPersistence.write(usuario);
    state = AsyncValue.data(usuario);
  }

  Future<void> attemptLogout() async {
    try {
      await logoutRequest(networkClient: ApiRest());
    } catch (exception) {
      // ignore: avoid_print
      print(exception);
    }
    await UsuarioPersistence.remove();
    state = const AsyncValue.data(null);
  }

  Future<void> marcarTreinoComoConcluido(int treinoId) async {
    final usuarioAtual = state.value;
    if (usuarioAtual == null) return;

    final treinosAtualizados = usuarioAtual.treinos.map((treino) {
      if (treino.id == treinoId) {
        return treino.copyWith(concluido: !treino.concluido);
      }
      return treino;
    }).toList();

    final usuarioAtualizado =
        usuarioAtual.copyWith(treinos: treinosAtualizados);

    await UsuarioPersistence.write(usuarioAtualizado);
    state = AsyncValue.data(usuarioAtualizado);
  }

  Future<void> marcarTreinoExercicioComoConcluido(
      int treinoId, int exercicioId, bool value) async {
    final usuarioAtual = state.value;
    if (usuarioAtual == null) return;

    final treinosAtualizados = usuarioAtual.treinos.map((treino) {
      if (treino.id == treinoId) {
        final exerciciosAtualizados = treino.exercicios.map((ex) {
          if (ex.exercicio?.id == exercicioId) {
            return ex.copyWith(concluido: value);
          }
          return ex;
        }).toList();

        return treino.copyWith(exercicios: exerciciosAtualizados);
      }
      return treino;
    }).toList();

    final usuarioAtualizado =
        usuarioAtual.copyWith(treinos: treinosAtualizados);

    await UsuarioPersistence.write(usuarioAtualizado);
    state = AsyncValue.data(usuarioAtualizado);
  }
}
