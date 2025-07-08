// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_treino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlunoTreinoImpl _$$AlunoTreinoImplFromJson(Map<String, dynamic> json) =>
    _$AlunoTreinoImpl(
      treino: Treino.fromJson(json['treino'] as Map<String, dynamic>),
      quantExecucoes: (json['quantExecucoes'] as num).toInt(),
      concluido: json['concluido'] as bool? ?? false,
    );

Map<String, dynamic> _$$AlunoTreinoImplToJson(_$AlunoTreinoImpl instance) =>
    <String, dynamic>{
      'treino': instance.treino,
      'quantExecucoes': instance.quantExecucoes,
      'concluido': instance.concluido,
    };
