import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercicio.freezed.dart';
part 'exercicio.g.dart';

@freezed
class Exercicio with _$Exercicio {
  factory Exercicio({
    @Default("") String? id,
    @Default("") String nome,
    @Default("") String descricao,
    @Default("") String idGrupoMuscular,
    @Default("") String nomeGrupoMuscular,
  }) = _Exercicio;

  factory Exercicio.fromJson(Map<String, Object?> json) =>
      _$ExercicioFromJson(json);
}
