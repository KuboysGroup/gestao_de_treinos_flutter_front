// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_muscular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrupoMuscularImpl _$$GrupoMuscularImplFromJson(Map<String, dynamic> json) =>
    _$GrupoMuscularImpl(
      id: json['id'] as String? ?? "",
      nome: json['nome'] as String? ?? "",
      exercicios: (json['exercicios'] as List<dynamic>?)
              ?.map((e) => Exercicio.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GrupoMuscularImplToJson(_$GrupoMuscularImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'exercicios': instance.exercicios,
    };
