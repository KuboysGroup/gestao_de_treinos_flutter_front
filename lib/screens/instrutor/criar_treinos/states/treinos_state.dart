import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino_exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/requests/treinos_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'treinos_state.g.dart';

@riverpod
class TreinosState extends _$TreinosState {
  @override
  Future<List<Treino>> build() async {
    return await TreinosRequests.getTreinos();
  }

  void adicionarTreino(Treino novoTreino) {
    state = state.whenData((treinos) {
      return [...treinos, novoTreino];
    });
  }

  void adicionarExercicio(TreinoExercicio exercicioTreino) {
    final treinoId = exercicioTreino.idTreino;

    if (treinoId == null) return;

    state = state.whenData((treinos) {
      return treinos.map((treino) {
        if (treino.id == treinoId) {
          final novaLista = [...treino.exercicios, exercicioTreino];
          return treino.copyWith(exercicios: novaLista);
        }
        return treino;
      }).toList();
    });
  }

  void removerExercicio(String exercicioId) async {
    state = state.whenData((treinos) {
      return treinos.map((treino) {
        final novaListaExercicios = treino.exercicios
            .where((ex) => ex.idExercicio != exercicioId)
            .toList();
        return treino.copyWith(exercicios: novaListaExercicios);
      }).toList();
    });
  }
}
