// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercicio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExercicioImpl _$$ExercicioImplFromJson(Map<String, dynamic> json) =>
    _$ExercicioImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      nome: json['nome'] as String? ?? "",
      descricao: json['descricao'] as String? ?? "",
      grupoMuscular: json['grupoMuscular'] == null
          ? null
          : GrupoMuscular.fromJson(
              json['grupoMuscular'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExercicioImplToJson(_$ExercicioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'grupoMuscular': instance.grupoMuscular,
    };
