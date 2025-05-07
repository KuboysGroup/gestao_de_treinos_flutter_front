import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:gestao_de_treinos_flutter_front/screens/instrutor/criar_avaliacoes_fisicas/requests/avaliacoes_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'avaliacoes_state.g.dart';

@riverpod
class AvaliacoesState extends _$AvaliacoesState {
  @override
  Future<List<AvaliacaoFisica>> build(int id) async {
    return await AvaliacoesRequests.getAvaliacoes(id);
  }

  void removerAvaliacao(int id) {
    state = state.whenData((avaliacoes) {
      return avaliacoes.where((avaliacao) => avaliacao.id != id).toList();
    });
  }
}
