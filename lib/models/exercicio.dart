import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/grupo_muscular.dart';

part 'exercicio.freezed.dart';
part 'exercicio.g.dart';

@freezed
class Exercicio with _$Exercicio {
  factory Exercicio({
    @Default(0) int? id,
    @Default("") String nome,
    @Default("") String descricao,
    GrupoMuscular? grupoMuscular,
  }) = _Exercicio;

  factory Exercicio.fromJson(Map<String, Object?> json) =>
      _$ExercicioFromJson(json);
}
