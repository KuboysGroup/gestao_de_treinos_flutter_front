import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino.dart';

part 'treino_exercicio.freezed.dart';
part 'treino_exercicio.g.dart';

@freezed
class TreinoExercicio with _$TreinoExercicio {
  factory TreinoExercicio({
    Treino? treino,
    Exercicio? exercicio,
    @Default(0) int series,
    @Default(0) int repeticoes,
    @Default(false) bool concluido,
  }) = _TreinoExercicio;

  factory TreinoExercicio.fromJson(Map<String, Object?> json) =>
      _$TreinoExercicioFromJson(json);
}
