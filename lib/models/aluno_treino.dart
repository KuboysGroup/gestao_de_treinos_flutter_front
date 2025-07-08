import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';

part 'aluno_treino.freezed.dart';
part 'aluno_treino.g.dart';

@freezed
class AlunoTreino with _$AlunoTreino {
  factory AlunoTreino({
    required Treino treino,
    required int quantExecucoes,
    @Default(false) bool concluido,
  }) = _AlunoTreino;

  factory AlunoTreino.fromJson(Map<String, Object?> json) =>
      _$AlunoTreinoFromJson(json);
}
