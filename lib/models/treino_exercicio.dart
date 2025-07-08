import 'package:freezed_annotation/freezed_annotation.dart';

part 'treino_exercicio.freezed.dart';
part 'treino_exercicio.g.dart';

@freezed
class TreinoExercicio with _$TreinoExercicio {
  factory TreinoExercicio({
    String? idTreino,
    String? idExercicio,
    @Default("") String nomeExercicio,
    @Default("") String nomeGrupoMuscular,
    @Default(0) int series,
    @Default(0) int repeticoes,
    @Default(false) bool concluido,
  }) = _TreinoExercicio;

  factory TreinoExercicio.fromJson(Map<String, Object?> json) =>
      _$TreinoExercicioFromJson(json);
}
