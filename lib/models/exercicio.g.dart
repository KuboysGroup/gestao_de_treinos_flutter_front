// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercicio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExercicioImpl _$$ExercicioImplFromJson(Map<String, dynamic> json) =>
    _$ExercicioImpl(
      id: json['id'] as String? ?? "",
      nome: json['nome'] as String? ?? "",
      descricao: json['descricao'] as String? ?? "",
      idGrupoMuscular: json['idGrupoMuscular'] as String? ?? "",
      nomeGrupoMuscular: json['nomeGrupoMuscular'] as String? ?? "",
    );

Map<String, dynamic> _$$ExercicioImplToJson(_$ExercicioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'idGrupoMuscular': instance.idGrupoMuscular,
      'nomeGrupoMuscular': instance.nomeGrupoMuscular,
    };
