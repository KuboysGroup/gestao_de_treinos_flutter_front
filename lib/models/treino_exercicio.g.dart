// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treino_exercicio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinoExercicioImpl _$$TreinoExercicioImplFromJson(
        Map<String, dynamic> json) =>
    _$TreinoExercicioImpl(
      treino: json['treino'] == null
          ? null
          : Treino.fromJson(json['treino'] as Map<String, dynamic>),
      exercicio: json['exercicio'] == null
          ? null
          : Exercicio.fromJson(json['exercicio'] as Map<String, dynamic>),
      series: (json['series'] as num?)?.toInt() ?? 0,
      repeticoes: (json['repeticoes'] as num?)?.toInt() ?? 0,
      concluido: json['concluido'] as bool? ?? false,
    );

Map<String, dynamic> _$$TreinoExercicioImplToJson(
        _$TreinoExercicioImpl instance) =>
    <String, dynamic>{
      'treino': instance.treino,
      'exercicio': instance.exercicio,
      'series': instance.series,
      'repeticoes': instance.repeticoes,
      'concluido': instance.concluido,
    };
