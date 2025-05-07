import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercicio_selecionado_state.g.dart';

@riverpod
class ExercicioSelecionadoState extends _$ExercicioSelecionadoState {
  @override
  Exercicio? build() {
    return null;
  }

  void selecionarGrupo(Exercicio grupo) {
    state = grupo;
  }
}
