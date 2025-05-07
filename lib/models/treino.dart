import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/treino_exercicio.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';

part 'treino.freezed.dart';
part 'treino.g.dart';

@freezed
class Treino with _$Treino {
  factory Treino({
    @Default(0) int id,
    @Default("") String nome,
    @Default([]) List<TreinoExercicio> exercicios,
    @Default([]) List<Usuario> alunos,
    @Default(false) bool concluido,
    Usuario? instrutor, // Tornado nullable
  }) = _Treino;

  factory Treino.fromJson(Map<String, Object?> json) => _$TreinoFromJson(json);
}
