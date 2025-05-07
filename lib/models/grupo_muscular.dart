import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/exercicio.dart';

part 'grupo_muscular.freezed.dart';
part 'grupo_muscular.g.dart';

@freezed
class GrupoMuscular with _$GrupoMuscular {
  factory GrupoMuscular({
    @Default(0) int id,
    @Default("") String nome,
    @Default([]) List<Exercicio> exercicios,
  }) = _GrupoMuscular;

  factory GrupoMuscular.fromJson(Map<String, Object?> json) =>
      _$GrupoMuscularFromJson(json);
}
