// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grupo_muscular.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GrupoMuscular _$GrupoMuscularFromJson(Map<String, dynamic> json) {
  return _GrupoMuscular.fromJson(json);
}

/// @nodoc
mixin _$GrupoMuscular {
  String get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  List<Exercicio> get exercicios => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GrupoMuscularCopyWith<GrupoMuscular> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GrupoMuscularCopyWith<$Res> {
  factory $GrupoMuscularCopyWith(
          GrupoMuscular value, $Res Function(GrupoMuscular) then) =
      _$GrupoMuscularCopyWithImpl<$Res, GrupoMuscular>;
  @useResult
  $Res call({String id, String nome, List<Exercicio> exercicios});
}

/// @nodoc
class _$GrupoMuscularCopyWithImpl<$Res, $Val extends GrupoMuscular>
    implements $GrupoMuscularCopyWith<$Res> {
  _$GrupoMuscularCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? exercicios = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      exercicios: null == exercicios
          ? _value.exercicios
          : exercicios // ignore: cast_nullable_to_non_nullable
              as List<Exercicio>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GrupoMuscularImplCopyWith<$Res>
    implements $GrupoMuscularCopyWith<$Res> {
  factory _$$GrupoMuscularImplCopyWith(
          _$GrupoMuscularImpl value, $Res Function(_$GrupoMuscularImpl) then) =
      __$$GrupoMuscularImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String nome, List<Exercicio> exercicios});
}

/// @nodoc
class __$$GrupoMuscularImplCopyWithImpl<$Res>
    extends _$GrupoMuscularCopyWithImpl<$Res, _$GrupoMuscularImpl>
    implements _$$GrupoMuscularImplCopyWith<$Res> {
  __$$GrupoMuscularImplCopyWithImpl(
      _$GrupoMuscularImpl _value, $Res Function(_$GrupoMuscularImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? exercicios = null,
  }) {
    return _then(_$GrupoMuscularImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      exercicios: null == exercicios
          ? _value._exercicios
          : exercicios // ignore: cast_nullable_to_non_nullable
              as List<Exercicio>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GrupoMuscularImpl implements _GrupoMuscular {
  _$GrupoMuscularImpl(
      {this.id = "",
      this.nome = "",
      final List<Exercicio> exercicios = const []})
      : _exercicios = exercicios;

  factory _$GrupoMuscularImpl.fromJson(Map<String, dynamic> json) =>
      _$$GrupoMuscularImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String nome;
  final List<Exercicio> _exercicios;
  @override
  @JsonKey()
  List<Exercicio> get exercicios {
    if (_exercicios is EqualUnmodifiableListView) return _exercicios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercicios);
  }

  @override
  String toString() {
    return 'GrupoMuscular(id: $id, nome: $nome, exercicios: $exercicios)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GrupoMuscularImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            const DeepCollectionEquality()
                .equals(other._exercicios, _exercicios));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nome, const DeepCollectionEquality().hash(_exercicios));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GrupoMuscularImplCopyWith<_$GrupoMuscularImpl> get copyWith =>
      __$$GrupoMuscularImplCopyWithImpl<_$GrupoMuscularImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GrupoMuscularImplToJson(
      this,
    );
  }
}

abstract class _GrupoMuscular implements GrupoMuscular {
  factory _GrupoMuscular(
      {final String id,
      final String nome,
      final List<Exercicio> exercicios}) = _$GrupoMuscularImpl;

  factory _GrupoMuscular.fromJson(Map<String, dynamic> json) =
      _$GrupoMuscularImpl.fromJson;

  @override
  String get id;
  @override
  String get nome;
  @override
  List<Exercicio> get exercicios;
  @override
  @JsonKey(ignore: true)
  _$$GrupoMuscularImplCopyWith<_$GrupoMuscularImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
