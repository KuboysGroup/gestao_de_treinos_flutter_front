// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacao_fisica.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvaliacaoFisicaImpl _$$AvaliacaoFisicaImplFromJson(
        Map<String, dynamic> json) =>
    _$AvaliacaoFisicaImpl(
      id: json['id'] as String? ?? "",
      idAluno: json['idAluno'] as String?,
      nomeAluno: json['nomeAluno'] as String? ?? "",
      idInstrutor: json['idInstrutor'] as String?,
      nomeInstrutor: json['nomeInstrutor'] as String? ?? "",
      data: json['data'] as String? ?? "",
      peso: (json['peso'] as num?)?.toDouble() ?? 0.0,
      altura: (json['altura'] as num?)?.toDouble() ?? 0.0,
      imc: (json['imc'] as num?)?.toDouble() ?? 0.0,
      percentualGordura: (json['percentualGordura'] as num?)?.toDouble() ?? 0.0,
      massaMuscularKg: (json['massaMuscularKg'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$AvaliacaoFisicaImplToJson(
        _$AvaliacaoFisicaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idAluno': instance.idAluno,
      'nomeAluno': instance.nomeAluno,
      'idInstrutor': instance.idInstrutor,
      'nomeInstrutor': instance.nomeInstrutor,
      'data': instance.data,
      'peso': instance.peso,
      'altura': instance.altura,
      'imc': instance.imc,
      'percentualGordura': instance.percentualGordura,
      'massaMuscularKg': instance.massaMuscularKg,
    };
