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
  int? get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  GrupoMuscular? get grupoMuscular => throw _privateConstructorUsedError;

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
      {int? id, String nome, String descricao, GrupoMuscular? grupoMuscular});

  $GrupoMuscularCopyWith<$Res>? get grupoMuscular;
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
    Object? grupoMuscular = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      grupoMuscular: freezed == grupoMuscular
          ? _value.grupoMuscular
          : grupoMuscular // ignore: cast_nullable_to_non_nullable
              as GrupoMuscular?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GrupoMuscularCopyWith<$Res>? get grupoMuscular {
    if (_value.grupoMuscular == null) {
      return null;
    }

    return $GrupoMuscularCopyWith<$Res>(_value.grupoMuscular!, (value) {
      return _then(_value.copyWith(grupoMuscular: value) as $Val);
    });
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
      {int? id, String nome, String descricao, GrupoMuscular? grupoMuscular});

  @override
  $GrupoMuscularCopyWith<$Res>? get grupoMuscular;
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
    Object? grupoMuscular = freezed,
  }) {
    return _then(_$ExercicioImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      grupoMuscular: freezed == grupoMuscular
          ? _value.grupoMuscular
          : grupoMuscular // ignore: cast_nullable_to_non_nullable
              as GrupoMuscular?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExercicioImpl implements _Exercicio {
  _$ExercicioImpl(
      {this.id = 0, this.nome = "", this.descricao = "", this.grupoMuscular});

  factory _$ExercicioImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExercicioImplFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String nome;
  @override
  @JsonKey()
  final String descricao;
  @override
  final GrupoMuscular? grupoMuscular;

  @override
  String toString() {
    return 'Exercicio(id: $id, nome: $nome, descricao: $descricao, grupoMuscular: $grupoMuscular)';
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
            (identical(other.grupoMuscular, grupoMuscular) ||
                other.grupoMuscular == grupoMuscular));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nome, descricao, grupoMuscular);

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
      {final int? id,
      final String nome,
      final String descricao,
      final GrupoMuscular? grupoMuscular}) = _$ExercicioImpl;

  factory _Exercicio.fromJson(Map<String, dynamic> json) =
      _$ExercicioImpl.fromJson;

  @override
  int? get id;
  @override
  String get nome;
  @override
  String get descricao;
  @override
  GrupoMuscular? get grupoMuscular;
  @override
  @JsonKey(ignore: true)
  _$$ExercicioImplCopyWith<_$ExercicioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
