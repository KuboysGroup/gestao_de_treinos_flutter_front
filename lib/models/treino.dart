import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino_exercicio.dart';

part 'treino.freezed.dart';
part 'treino.g.dart';

@freezed
class Treino with _$Treino {
  factory Treino({
    @Default("") String id,
    @Default("") String nome,
    @Default("") String idInstrutor,
    @Default("") String nomeInstrutor,
    @Default([]) List<TreinoExercicio> exercicios,
    @Default(false) bool concluido,
  }) = _Treino;

  factory Treino.fromJson(Map<String, Object?> json) => _$TreinoFromJson(json);
}
