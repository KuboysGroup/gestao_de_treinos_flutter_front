import 'package:gestao_de_treinos_flutter_front/models/avaliacao_fisica.dart';
import 'package:gestao_de_treinos_flutter_front/screens/aluno/avaliacoes_fisicas/requests/avaliacoes_requests.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'avaliacao_state.g.dart';

@riverpod
class AvaliacaoState extends _$AvaliacaoState {
  @override
  Future<List<AvaliacaoFisica>> build(int id) async {
    return await AvaliacoesRequests.getAvaliacoes(id);
  }
}
