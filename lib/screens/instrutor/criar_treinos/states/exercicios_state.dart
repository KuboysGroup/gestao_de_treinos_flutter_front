import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_treinos/requests/treinos_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exercicios_state.g.dart';

@riverpod
class ExerciciosState extends _$ExerciciosState {
  @override
  Future<List<Exercicio>> build() async {
    return await TreinosRequests.getExercicios();
  }
}
