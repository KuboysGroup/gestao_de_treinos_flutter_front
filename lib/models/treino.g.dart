// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinoImpl _$$TreinoImplFromJson(Map<String, dynamic> json) => _$TreinoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nome: json['nome'] as String? ?? "",
      exercicios: (json['exercicios'] as List<dynamic>?)
              ?.map((e) => TreinoExercicio.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      alunos: (json['alunos'] as List<dynamic>?)
              ?.map((e) => Usuario.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      concluido: json['concluido'] as bool? ?? false,
      instrutor: json['instrutor'] == null
          ? null
          : Usuario.fromJson(json['instrutor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TreinoImplToJson(_$TreinoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'exercicios': instance.exercicios,
      'alunos': instance.alunos,
      'concluido': instance.concluido,
      'instrutor': instance.instrutor,
    };
