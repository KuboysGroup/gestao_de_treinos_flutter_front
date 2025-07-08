// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioImpl _$$UsuarioImplFromJson(Map<String, dynamic> json) =>
    _$UsuarioImpl(
      id: json['id'] as String? ?? "",
      nome: json['nome'] as String? ?? "",
      email: json['email'] as String? ?? "",
      senha: json['senha'] as String? ?? "",
      dataNascimento: json['dataNascimento'] as String? ?? "",
      perfil: json['perfil'] as String? ?? "",
      treinos: (json['treinos'] as List<dynamic>?)
              ?.map((e) => AlunoTreino.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UsuarioImplToJson(_$UsuarioImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'senha': instance.senha,
      'dataNascimento': instance.dataNascimento,
      'perfil': instance.perfil,
      'treinos': instance.treinos,
    };
