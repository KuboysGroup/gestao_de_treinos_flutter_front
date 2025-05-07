import 'package:gestao_de_treinos_flutter_front/models/grupo_muscular.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grupo_muscular_selecionado_state.g.dart';

@riverpod
class GrupoMuscularSelecionadoState extends _$GrupoMuscularSelecionadoState {
  @override
  GrupoMuscular? build() {
    return null;
  }

  void selecionarGrupo(GrupoMuscular grupo) {
    state = grupo;
  }
}
