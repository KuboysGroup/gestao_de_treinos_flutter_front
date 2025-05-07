import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';

part 'avaliacao_fisica.freezed.dart';
part 'avaliacao_fisica.g.dart';

@freezed
class AvaliacaoFisica with _$AvaliacaoFisica {
  factory AvaliacaoFisica({
    @Default(0) int? id,
    Usuario? aluno,
    Usuario? instrutor,
    @Default("") String data,
    @Default(0.0) double peso,
    @Default(0.0) double altura,
    @Default(0.0) double imc,
    @Default(0.0) double percentualGordura,
    @Default(0.0) double massaMuscularKg,
  }) = _AvaliacaoFisica;

  factory AvaliacaoFisica.fromJson(Map<String, Object?> json) =>
      _$AvaliacaoFisicaFromJson(json);
}
