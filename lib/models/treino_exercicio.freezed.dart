// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treino_exercicio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreinoExercicio _$TreinoExercicioFromJson(Map<String, dynamic> json) {
  return _TreinoExercicio.fromJson(json);
}

/// @nodoc
mixin _$TreinoExercicio {
  Treino? get treino => throw _privateConstructorUsedError;
  Exercicio? get exercicio => throw _privateConstructorUsedError;
  int get series => throw _privateConstructorUsedError;
  int get repeticoes => throw _privateConstructorUsedError;
  bool get concluido => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreinoExercicioCopyWith<TreinoExercicio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreinoExercicioCopyWith<$Res> {
  factory $TreinoExercicioCopyWith(
          TreinoExercicio value, $Res Function(TreinoExercicio) then) =
      _$TreinoExercicioCopyWithImpl<$Res, TreinoExercicio>;
  @useResult
  $Res call(
      {Treino? treino,
      Exercicio? exercicio,
      int series,
      int repeticoes,
      bool concluido});

  $TreinoCopyWith<$Res>? get treino;
  $ExercicioCopyWith<$Res>? get exercicio;
}

/// @nodoc
class _$TreinoExercicioCopyWithImpl<$Res, $Val extends TreinoExercicio>
    implements $TreinoExercicioCopyWith<$Res> {
  _$TreinoExercicioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treino = freezed,
    Object? exercicio = freezed,
    Object? series = null,
    Object? repeticoes = null,
    Object? concluido = null,
  }) {
    return _then(_value.copyWith(
      treino: freezed == treino
          ? _value.treino
          : treino // ignore: cast_nullable_to_non_nullable
              as Treino?,
      exercicio: freezed == exercicio
          ? _value.exercicio
          : exercicio // ignore: cast_nullable_to_non_nullable
              as Exercicio?,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as int,
      repeticoes: null == repeticoes
          ? _value.repeticoes
          : repeticoes // ignore: cast_nullable_to_non_nullable
              as int,
      concluido: null == concluido
          ? _value.concluido
          : concluido // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TreinoCopyWith<$Res>? get treino {
    if (_value.treino == null) {
      return null;
    }

    return $TreinoCopyWith<$Res>(_value.treino!, (value) {
      return _then(_value.copyWith(treino: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExercicioCopyWith<$Res>? get exercicio {
    if (_value.exercicio == null) {
      return null;
    }

    return $ExercicioCopyWith<$Res>(_value.exercicio!, (value) {
      return _then(_value.copyWith(exercicio: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TreinoExercicioImplCopyWith<$Res>
    implements $TreinoExercicioCopyWith<$Res> {
  factory _$$TreinoExercicioImplCopyWith(_$TreinoExercicioImpl value,
          $Res Function(_$TreinoExercicioImpl) then) =
      __$$TreinoExercicioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Treino? treino,
      Exercicio? exercicio,
      int series,
      int repeticoes,
      bool concluido});

  @override
  $TreinoCopyWith<$Res>? get treino;
  @override
  $ExercicioCopyWith<$Res>? get exercicio;
}

/// @nodoc
class __$$TreinoExercicioImplCopyWithImpl<$Res>
    extends _$TreinoExercicioCopyWithImpl<$Res, _$TreinoExercicioImpl>
    implements _$$TreinoExercicioImplCopyWith<$Res> {
  __$$TreinoExercicioImplCopyWithImpl(
      _$TreinoExercicioImpl _value, $Res Function(_$TreinoExercicioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treino = freezed,
    Object? exercicio = freezed,
    Object? series = null,
    Object? repeticoes = null,
    Object? concluido = null,
  }) {
    return _then(_$TreinoExercicioImpl(
      treino: freezed == treino
          ? _value.treino
          : treino // ignore: cast_nullable_to_non_nullable
              as Treino?,
      exercicio: freezed == exercicio
          ? _value.exercicio
          : exercicio // ignore: cast_nullable_to_non_nullable
              as Exercicio?,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as int,
      repeticoes: null == repeticoes
          ? _value.repeticoes
          : repeticoes // ignore: cast_nullable_to_non_nullable
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
class _$TreinoExercicioImpl implements _TreinoExercicio {
  _$TreinoExercicioImpl(
      {this.treino,
      this.exercicio,
      this.series = 0,
      this.repeticoes = 0,
      this.concluido = false});

  factory _$TreinoExercicioImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreinoExercicioImplFromJson(json);

  @override
  final Treino? treino;
  @override
  final Exercicio? exercicio;
  @override
  @JsonKey()
  final int series;
  @override
  @JsonKey()
  final int repeticoes;
  @override
  @JsonKey()
  final bool concluido;

  @override
  String toString() {
    return 'TreinoExercicio(treino: $treino, exercicio: $exercicio, series: $series, repeticoes: $repeticoes, concluido: $concluido)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreinoExercicioImpl &&
            (identical(other.treino, treino) || other.treino == treino) &&
            (identical(other.exercicio, exercicio) ||
                other.exercicio == exercicio) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.repeticoes, repeticoes) ||
                other.repeticoes == repeticoes) &&
            (identical(other.concluido, concluido) ||
                other.concluido == concluido));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, treino, exercicio, series, repeticoes, concluido);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TreinoExercicioImplCopyWith<_$TreinoExercicioImpl> get copyWith =>
      __$$TreinoExercicioImplCopyWithImpl<_$TreinoExercicioImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreinoExercicioImplToJson(
      this,
    );
  }
}

abstract class _TreinoExercicio implements TreinoExercicio {
  factory _TreinoExercicio(
      {final Treino? treino,
      final Exercicio? exercicio,
      final int series,
      final int repeticoes,
      final bool concluido}) = _$TreinoExercicioImpl;

  factory _TreinoExercicio.fromJson(Map<String, dynamic> json) =
      _$TreinoExercicioImpl.fromJson;

  @override
  Treino? get treino;
  @override
  Exercicio? get exercicio;
  @override
  int get series;
  @override
  int get repeticoes;
  @override
  bool get concluido;
  @override
  @JsonKey(ignore: true)
  _$$TreinoExercicioImplCopyWith<_$TreinoExercicioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
