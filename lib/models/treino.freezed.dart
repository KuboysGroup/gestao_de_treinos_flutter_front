// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treino.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Treino _$TreinoFromJson(Map<String, dynamic> json) {
  return _Treino.fromJson(json);
}

/// @nodoc
mixin _$Treino {
  int get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  List<TreinoExercicio> get exercicios => throw _privateConstructorUsedError;
  List<Usuario> get alunos => throw _privateConstructorUsedError;
  bool get concluido => throw _privateConstructorUsedError;
  Usuario? get instrutor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreinoCopyWith<Treino> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreinoCopyWith<$Res> {
  factory $TreinoCopyWith(Treino value, $Res Function(Treino) then) =
      _$TreinoCopyWithImpl<$Res, Treino>;
  @useResult
  $Res call(
      {int id,
      String nome,
      List<TreinoExercicio> exercicios,
      List<Usuario> alunos,
      bool concluido,
      Usuario? instrutor});

  $UsuarioCopyWith<$Res>? get instrutor;
}

/// @nodoc
class _$TreinoCopyWithImpl<$Res, $Val extends Treino>
    implements $TreinoCopyWith<$Res> {
  _$TreinoCopyWithImpl(this._value, this._then);

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
    Object? alunos = null,
    Object? concluido = null,
    Object? instrutor = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      exercicios: null == exercicios
          ? _value.exercicios
          : exercicios // ignore: cast_nullable_to_non_nullable
              as List<TreinoExercicio>,
      alunos: null == alunos
          ? _value.alunos
          : alunos // ignore: cast_nullable_to_non_nullable
              as List<Usuario>,
      concluido: null == concluido
          ? _value.concluido
          : concluido // ignore: cast_nullable_to_non_nullable
              as bool,
      instrutor: freezed == instrutor
          ? _value.instrutor
          : instrutor // ignore: cast_nullable_to_non_nullable
              as Usuario?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioCopyWith<$Res>? get instrutor {
    if (_value.instrutor == null) {
      return null;
    }

    return $UsuarioCopyWith<$Res>(_value.instrutor!, (value) {
      return _then(_value.copyWith(instrutor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TreinoImplCopyWith<$Res> implements $TreinoCopyWith<$Res> {
  factory _$$TreinoImplCopyWith(
          _$TreinoImpl value, $Res Function(_$TreinoImpl) then) =
      __$$TreinoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String nome,
      List<TreinoExercicio> exercicios,
      List<Usuario> alunos,
      bool concluido,
      Usuario? instrutor});

  @override
  $UsuarioCopyWith<$Res>? get instrutor;
}

/// @nodoc
class __$$TreinoImplCopyWithImpl<$Res>
    extends _$TreinoCopyWithImpl<$Res, _$TreinoImpl>
    implements _$$TreinoImplCopyWith<$Res> {
  __$$TreinoImplCopyWithImpl(
      _$TreinoImpl _value, $Res Function(_$TreinoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nome = null,
    Object? exercicios = null,
    Object? alunos = null,
    Object? concluido = null,
    Object? instrutor = freezed,
  }) {
    return _then(_$TreinoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      exercicios: null == exercicios
          ? _value._exercicios
          : exercicios // ignore: cast_nullable_to_non_nullable
              as List<TreinoExercicio>,
      alunos: null == alunos
          ? _value._alunos
          : alunos // ignore: cast_nullable_to_non_nullable
              as List<Usuario>,
      concluido: null == concluido
          ? _value.concluido
          : concluido // ignore: cast_nullable_to_non_nullable
              as bool,
      instrutor: freezed == instrutor
          ? _value.instrutor
          : instrutor // ignore: cast_nullable_to_non_nullable
              as Usuario?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreinoImpl implements _Treino {
  _$TreinoImpl(
      {this.id = 0,
      this.nome = "",
      final List<TreinoExercicio> exercicios = const [],
      final List<Usuario> alunos = const [],
      this.concluido = false,
      this.instrutor})
      : _exercicios = exercicios,
        _alunos = alunos;

  factory _$TreinoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreinoImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String nome;
  final List<TreinoExercicio> _exercicios;
  @override
  @JsonKey()
  List<TreinoExercicio> get exercicios {
    if (_exercicios is EqualUnmodifiableListView) return _exercicios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercicios);
  }

  final List<Usuario> _alunos;
  @override
  @JsonKey()
  List<Usuario> get alunos {
    if (_alunos is EqualUnmodifiableListView) return _alunos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alunos);
  }

  @override
  @JsonKey()
  final bool concluido;
  @override
  final Usuario? instrutor;

  @override
  String toString() {
    return 'Treino(id: $id, nome: $nome, exercicios: $exercicios, alunos: $alunos, concluido: $concluido, instrutor: $instrutor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreinoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            const DeepCollectionEquality()
                .equals(other._exercicios, _exercicios) &&
            const DeepCollectionEquality().equals(other._alunos, _alunos) &&
            (identical(other.concluido, concluido) ||
                other.concluido == concluido) &&
            (identical(other.instrutor, instrutor) ||
                other.instrutor == instrutor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nome,
      const DeepCollectionEquality().hash(_exercicios),
      const DeepCollectionEquality().hash(_alunos),
      concluido,
      instrutor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreinoImplCopyWith<_$TreinoImpl> get copyWith =>
      __$$TreinoImplCopyWithImpl<_$TreinoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreinoImplToJson(
      this,
    );
  }
}

abstract class _Treino implements Treino {
  factory _Treino(
      {final int id,
      final String nome,
      final List<TreinoExercicio> exercicios,
      final List<Usuario> alunos,
      final bool concluido,
      final Usuario? instrutor}) = _$TreinoImpl;

  factory _Treino.fromJson(Map<String, dynamic> json) = _$TreinoImpl.fromJson;

  @override
  int get id;
  @override
  String get nome;
  @override
  List<TreinoExercicio> get exercicios;
  @override
  List<Usuario> get alunos;
  @override
  bool get concluido;
  @override
  Usuario? get instrutor;
  @override
  @JsonKey(ignore: true)
  _$$TreinoImplCopyWith<_$TreinoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
