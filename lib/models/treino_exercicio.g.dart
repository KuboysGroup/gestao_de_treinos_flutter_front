// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treino_exercicio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinoExercicioImpl _$$TreinoExercicioImplFromJson(
        Map<String, dynamic> json) =>
    _$TreinoExercicioImpl(
      idTreino: json['idTreino'] as String?,
      idExercicio: json['idExercicio'] as String?,
      nomeExercicio: json['nomeExercicio'] as String? ?? "",
      nomeGrupoMuscular: json['nomeGrupoMuscular'] as String? ?? "",
      series: (json['series'] as num?)?.toInt() ?? 0,
      repeticoes: (json['repeticoes'] as num?)?.toInt() ?? 0,
      concluido: json['concluido'] as bool? ?? false,
    );

Map<String, dynamic> _$$TreinoExercicioImplToJson(
        _$TreinoExercicioImpl instance) =>
    <String, dynamic>{
      'idTreino': instance.idTreino,
      'idExercicio': instance.idExercicio,
      'nomeExercicio': instance.nomeExercicio,
      'nomeGrupoMuscular': instance.nomeGrupoMuscular,
      'series': instance.series,
      'repeticoes': instance.repeticoes,
      'concluido': instance.concluido,
    };
