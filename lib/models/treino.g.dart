// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinoImpl _$$TreinoImplFromJson(Map<String, dynamic> json) => _$TreinoImpl(
      id: json['id'] as String? ?? "",
      nome: json['nome'] as String? ?? "",
      idInstrutor: json['idInstrutor'] as String? ?? "",
      nomeInstrutor: json['nomeInstrutor'] as String? ?? "",
      exercicios: (json['exercicios'] as List<dynamic>?)
              ?.map((e) => TreinoExercicio.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      concluido: json['concluido'] as bool? ?? false,
    );

Map<String, dynamic> _$$TreinoImplToJson(_$TreinoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'idInstrutor': instance.idInstrutor,
      'nomeInstrutor': instance.nomeInstrutor,
      'exercicios': instance.exercicios,
      'concluido': instance.concluido,
    };
