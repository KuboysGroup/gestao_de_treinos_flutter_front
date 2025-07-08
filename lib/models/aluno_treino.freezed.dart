// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aluno_treino.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlunoTreino _$AlunoTreinoFromJson(Map<String, dynamic> json) {
  return _AlunoTreino.fromJson(json);
}

/// @nodoc
mixin _$AlunoTreino {
  Treino get treino => throw _privateConstructorUsedError;
  int get quantExecucoes => throw _privateConstructorUsedError;
  bool get concluido => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlunoTreinoCopyWith<AlunoTreino> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlunoTreinoCopyWith<$Res> {
  factory $AlunoTreinoCopyWith(
          AlunoTreino value, $Res Function(AlunoTreino) then) =
      _$AlunoTreinoCopyWithImpl<$Res, AlunoTreino>;
  @useResult
  $Res call({Treino treino, int quantExecucoes, bool concluido});

  $TreinoCopyWith<$Res> get treino;
}

/// @nodoc
class _$AlunoTreinoCopyWithImpl<$Res, $Val extends AlunoTreino>
    implements $AlunoTreinoCopyWith<$Res> {
  _$AlunoTreinoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treino = null,
    Object? quantExecucoes = null,
    Object? concluido = null,
  }) {
    return _then(_value.copyWith(
      treino: null == treino
          ? _value.treino
          : treino // ignore: cast_nullable_to_non_nullable
              as Treino,
      quantExecucoes: null == quantExecucoes
          ? _value.quantExecucoes
          : quantExecucoes // ignore: cast_nullable_to_non_nullable
              as int,
      concluido: null == concluido
          ? _value.concluido
          : concluido // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TreinoCopyWith<$Res> get treino {
    return $TreinoCopyWith<$Res>(_value.treino, (value) {
      return _then(_value.copyWith(treino: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlunoTreinoImplCopyWith<$Res>
    implements $AlunoTreinoCopyWith<$Res> {
  factory _$$AlunoTreinoImplCopyWith(
          _$AlunoTreinoImpl value, $Res Function(_$AlunoTreinoImpl) then) =
      __$$AlunoTreinoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Treino treino, int quantExecucoes, bool concluido});

  @override
  $TreinoCopyWith<$Res> get treino;
}

/// @nodoc
class __$$AlunoTreinoImplCopyWithImpl<$Res>
    extends _$AlunoTreinoCopyWithImpl<$Res, _$AlunoTreinoImpl>
    implements _$$AlunoTreinoImplCopyWith<$Res> {
  __$$AlunoTreinoImplCopyWithImpl(
      _$AlunoTreinoImpl _value, $Res Function(_$AlunoTreinoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treino = null,
    Object? quantExecucoes = null,
    Object? concluido = null,
  }) {
    return _then(_$AlunoTreinoImpl(
      treino: null == treino
          ? _value.treino
          : treino // ignore: cast_nullable_to_non_nullable
              as Treino,
      quantExecucoes: null == quantExecucoes
          ? _value.quantExecucoes
          : quantExecucoes // ignore: cast_nullable_to_non_nullable
              as int,
      concluido: null == concluido
          ? _value.concluido
          : concluido // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlunoTreinoImpl implements _AlunoTreino {
  _$AlunoTreinoImpl(
      {required this.treino,
      required this.quantExecucoes,
      this.concluido = false});

  factory _$AlunoTreinoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlunoTreinoImplFromJson(json);

  @override
  final Treino treino;
  @override
  final int quantExecucoes;
  @override
  @JsonKey()
  final bool concluido;

  @override
  String toString() {
    return 'AlunoTreino(treino: $treino, quantExecucoes: $quantExecucoes, concluido: $concluido)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlunoTreinoImpl &&
            (identical(other.treino, treino) || other.treino == treino) &&
            (identical(other.quantExecucoes, quantExecucoes) ||
                other.quantExecucoes == quantExecucoes) &&
            (identical(other.concluido, concluido) ||
                other.concluido == concluido));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, treino, quantExecucoes, concluido);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlunoTreinoImplCopyWith<_$AlunoTreinoImpl> get copyWith =>
      __$$AlunoTreinoImplCopyWithImpl<_$AlunoTreinoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlunoTreinoImplToJson(
      this,
    );
  }
}

abstract class _AlunoTreino implements AlunoTreino {
  factory _AlunoTreino(
      {required final Treino treino,
      required final int quantExecucoes,
      final bool concluido}) = _$AlunoTreinoImpl;

  factory _AlunoTreino.fromJson(Map<String, dynamic> json) =
      _$AlunoTreinoImpl.fromJson;

  @override
  Treino get treino;
  @override
  int get quantExecucoes;
  @override
  bool get concluido;
  @override
  @JsonKey(ignore: true)
  _$$AlunoTreinoImplCopyWith<_$AlunoTreinoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
