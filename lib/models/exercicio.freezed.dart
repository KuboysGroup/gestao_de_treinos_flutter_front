// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercicio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exercicio _$ExercicioFromJson(Map<String, dynamic> json) {
  return _Exercicio.fromJson(json);
}

/// @nodoc
mixin _$Exercicio {
  String? get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  String get idGrupoMuscular => throw _privateConstructorUsedError;
  String get nomeGrupoMuscular => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExercicioCopyWith<Exercicio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExercicioCopyWith<$Res> {
  factory $ExercicioCopyWith(Exercicio value, $Res Function(Exercicio) then) =
      _$ExercicioCopyWithImpl<$Res, Exercicio>;
  @useResult
  $Res call(
      {String? id,
      String nome,
      String descricao,
      String idGrupoMuscular,
      String nomeGrupoMuscular});
}

/// @nodoc
class _$ExercicioCopyWithImpl<$Res, $Val extends Exercicio>
    implements $ExercicioCopyWith<$Res> {
  _$ExercicioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? descricao = null,
    Object? idGrupoMuscular = null,
    Object? nomeGrupoMuscular = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      idGrupoMuscular: null == idGrupoMuscular
          ? _value.idGrupoMuscular
          : idGrupoMuscular // ignore: cast_nullable_to_non_nullable
              as String,
      nomeGrupoMuscular: null == nomeGrupoMuscular
          ? _value.nomeGrupoMuscular
          : nomeGrupoMuscular // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExercicioImplCopyWith<$Res>
    implements $ExercicioCopyWith<$Res> {
  factory _$$ExercicioImplCopyWith(
          _$ExercicioImpl value, $Res Function(_$ExercicioImpl) then) =
      __$$ExercicioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String nome,
      String descricao,
      String idGrupoMuscular,
      String nomeGrupoMuscular});
}

/// @nodoc
class __$$ExercicioImplCopyWithImpl<$Res>
    extends _$ExercicioCopyWithImpl<$Res, _$ExercicioImpl>
    implements _$$ExercicioImplCopyWith<$Res> {
  __$$ExercicioImplCopyWithImpl(
      _$ExercicioImpl _value, $Res Function(_$ExercicioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? descricao = null,
    Object? idGrupoMuscular = null,
    Object? nomeGrupoMuscular = null,
  }) {
    return _then(_$ExercicioImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      idGrupoMuscular: null == idGrupoMuscular
          ? _value.idGrupoMuscular
          : idGrupoMuscular // ignore: cast_nullable_to_non_nullable
              as String,
      nomeGrupoMuscular: null == nomeGrupoMuscular
          ? _value.nomeGrupoMuscular
          : nomeGrupoMuscular // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExercicioImpl implements _Exercicio {
  _$ExercicioImpl(
      {this.id = "",
      this.nome = "",
      this.descricao = "",
      this.idGrupoMuscular = "",
      this.nomeGrupoMuscular = ""});

  factory _$ExercicioImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExercicioImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String nome;
  @override
  @JsonKey()
  final String descricao;
  @override
  @JsonKey()
  final String idGrupoMuscular;
  @override
  @JsonKey()
  final String nomeGrupoMuscular;

  @override
  String toString() {
    return 'Exercicio(id: $id, nome: $nome, descricao: $descricao, idGrupoMuscular: $idGrupoMuscular, nomeGrupoMuscular: $nomeGrupoMuscular)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExercicioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao) &&
            (identical(other.idGrupoMuscular, idGrupoMuscular) ||
                other.idGrupoMuscular == idGrupoMuscular) &&
            (identical(other.nomeGrupoMuscular, nomeGrupoMuscular) ||
                other.nomeGrupoMuscular == nomeGrupoMuscular));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nome, descricao, idGrupoMuscular, nomeGrupoMuscular);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExercicioImplCopyWith<_$ExercicioImpl> get copyWith =>
      __$$ExercicioImplCopyWithImpl<_$ExercicioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExercicioImplToJson(
      this,
    );
  }
}

abstract class _Exercicio implements Exercicio {
  factory _Exercicio(
      {final String? id,
      final String nome,
      final String descricao,
      final String idGrupoMuscular,
      final String nomeGrupoMuscular}) = _$ExercicioImpl;

  factory _Exercicio.fromJson(Map<String, dynamic> json) =
      _$ExercicioImpl.fromJson;

  @override
  String? get id;
  @override
  String get nome;
  @override
  String get descricao;
  @override
  String get idGrupoMuscular;
  @override
  String get nomeGrupoMuscular;
  @override
  @JsonKey(ignore: true)
  _$$ExercicioImplCopyWith<_$ExercicioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
