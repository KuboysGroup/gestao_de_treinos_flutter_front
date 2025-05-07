// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enum_padrao.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnumPadrao _$EnumPadraoFromJson(Map<String, dynamic> json) {
  return _EnumPadrao.fromJson(json);
}

/// @nodoc
mixin _$EnumPadrao {
  String get ENUM => throw _privateConstructorUsedError;
  String get LABEL => throw _privateConstructorUsedError;
  String get codigo => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnumPadraoCopyWith<EnumPadrao> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnumPadraoCopyWith<$Res> {
  factory $EnumPadraoCopyWith(
          EnumPadrao value, $Res Function(EnumPadrao) then) =
      _$EnumPadraoCopyWithImpl<$Res, EnumPadrao>;
  @useResult
  $Res call({String ENUM, String LABEL, String codigo, String descricao});
}

/// @nodoc
class _$EnumPadraoCopyWithImpl<$Res, $Val extends EnumPadrao>
    implements $EnumPadraoCopyWith<$Res> {
  _$EnumPadraoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ENUM = null,
    Object? LABEL = null,
    Object? codigo = null,
    Object? descricao = null,
  }) {
    return _then(_value.copyWith(
      ENUM: null == ENUM
          ? _value.ENUM
          : ENUM // ignore: cast_nullable_to_non_nullable
              as String,
      LABEL: null == LABEL
          ? _value.LABEL
          : LABEL // ignore: cast_nullable_to_non_nullable
              as String,
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnumPadraoImplCopyWith<$Res>
    implements $EnumPadraoCopyWith<$Res> {
  factory _$$EnumPadraoImplCopyWith(
          _$EnumPadraoImpl value, $Res Function(_$EnumPadraoImpl) then) =
      __$$EnumPadraoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ENUM, String LABEL, String codigo, String descricao});
}

/// @nodoc
class __$$EnumPadraoImplCopyWithImpl<$Res>
    extends _$EnumPadraoCopyWithImpl<$Res, _$EnumPadraoImpl>
    implements _$$EnumPadraoImplCopyWith<$Res> {
  __$$EnumPadraoImplCopyWithImpl(
      _$EnumPadraoImpl _value, $Res Function(_$EnumPadraoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ENUM = null,
    Object? LABEL = null,
    Object? codigo = null,
    Object? descricao = null,
  }) {
    return _then(_$EnumPadraoImpl(
      ENUM: null == ENUM
          ? _value.ENUM
          : ENUM // ignore: cast_nullable_to_non_nullable
              as String,
      LABEL: null == LABEL
          ? _value.LABEL
          : LABEL // ignore: cast_nullable_to_non_nullable
              as String,
      codigo: null == codigo
          ? _value.codigo
          : codigo // ignore: cast_nullable_to_non_nullable
              as String,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnumPadraoImpl implements _EnumPadrao {
  _$EnumPadraoImpl(
      {required this.ENUM,
      required this.LABEL,
      required this.codigo,
      required this.descricao});

  factory _$EnumPadraoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnumPadraoImplFromJson(json);

  @override
  final String ENUM;
  @override
  final String LABEL;
  @override
  final String codigo;
  @override
  final String descricao;

  @override
  String toString() {
    return 'EnumPadrao(ENUM: $ENUM, LABEL: $LABEL, codigo: $codigo, descricao: $descricao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnumPadraoImpl &&
            (identical(other.ENUM, ENUM) || other.ENUM == ENUM) &&
            (identical(other.LABEL, LABEL) || other.LABEL == LABEL) &&
            (identical(other.codigo, codigo) || other.codigo == codigo) &&
            (identical(other.descricao, descricao) ||
                other.descricao == descricao));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ENUM, LABEL, codigo, descricao);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnumPadraoImplCopyWith<_$EnumPadraoImpl> get copyWith =>
      __$$EnumPadraoImplCopyWithImpl<_$EnumPadraoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnumPadraoImplToJson(
      this,
    );
  }
}

abstract class _EnumPadrao implements EnumPadrao {
  factory _EnumPadrao(
      {required final String ENUM,
      required final String LABEL,
      required final String codigo,
      required final String descricao}) = _$EnumPadraoImpl;

  factory _EnumPadrao.fromJson(Map<String, dynamic> json) =
      _$EnumPadraoImpl.fromJson;

  @override
  String get ENUM;
  @override
  String get LABEL;
  @override
  String get codigo;
  @override
  String get descricao;
  @override
  @JsonKey(ignore: true)
  _$$EnumPadraoImplCopyWith<_$EnumPadraoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
