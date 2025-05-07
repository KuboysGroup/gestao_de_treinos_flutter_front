import 'package:gestao_de_treinos_flutter_front/models/treino.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/associar_treinos/requests/associar_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'treinos_state.g.dart';

@riverpod
class TreinosState extends _$TreinosState {
  @override
  Future<List<Treino>> build() async {
    return await AssociarRequests.getTreinos();
  }
}
