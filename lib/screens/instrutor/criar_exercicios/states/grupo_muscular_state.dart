import 'package:gestao_de_treinos_flutter_front/models/grupo_muscular.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_exercicios/requests/exercicios_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grupo_muscular_state.g.dart';

@riverpod
class GrupoMuscularState extends _$GrupoMuscularState {
  @override
  Future<List<GrupoMuscular>> build() async {
    return await ExerciciosRequests.getGrMuscular();
  }
}
