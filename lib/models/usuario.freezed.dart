// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return _Usuario.fromJson(json);
}

/// @nodoc
mixin _$Usuario {
  String? get id => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;
  String get dataNascimento => throw _privateConstructorUsedError;
  String get perfil => throw _privateConstructorUsedError;
  List<AlunoTreino> get treinos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioCopyWith<Usuario> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioCopyWith<$Res> {
  factory $UsuarioCopyWith(Usuario value, $Res Function(Usuario) then) =
      _$UsuarioCopyWithImpl<$Res, Usuario>;
  @useResult
  $Res call(
      {String? id,
      String nome,
      String email,
      String senha,
      String dataNascimento,
      String perfil,
      List<AlunoTreino> treinos});
}

/// @nodoc
class _$UsuarioCopyWithImpl<$Res, $Val extends Usuario>
    implements $UsuarioCopyWith<$Res> {
  _$UsuarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? email = null,
    Object? senha = null,
    Object? dataNascimento = null,
    Object? perfil = null,
    Object? treinos = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      senha: null == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String,
      dataNascimento: null == dataNascimento
          ? _value.dataNascimento
          : dataNascimento // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      treinos: null == treinos
          ? _value.treinos
          : treinos // ignore: cast_nullable_to_non_nullable
              as List<AlunoTreino>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsuarioImplCopyWith<$Res> implements $UsuarioCopyWith<$Res> {
  factory _$$UsuarioImplCopyWith(
          _$UsuarioImpl value, $Res Function(_$UsuarioImpl) then) =
      __$$UsuarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String nome,
      String email,
      String senha,
      String dataNascimento,
      String perfil,
      List<AlunoTreino> treinos});
}

/// @nodoc
class __$$UsuarioImplCopyWithImpl<$Res>
    extends _$UsuarioCopyWithImpl<$Res, _$UsuarioImpl>
    implements _$$UsuarioImplCopyWith<$Res> {
  __$$UsuarioImplCopyWithImpl(
      _$UsuarioImpl _value, $Res Function(_$UsuarioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = null,
    Object? email = null,
    Object? senha = null,
    Object? dataNascimento = null,
    Object? perfil = null,
    Object? treinos = null,
  }) {
    return _then(_$UsuarioImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      senha: null == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String,
      dataNascimento: null == dataNascimento
          ? _value.dataNascimento
          : dataNascimento // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      treinos: null == treinos
          ? _value._treinos
          : treinos // ignore: cast_nullable_to_non_nullable
              as List<AlunoTreino>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsuarioImpl implements _Usuario {
  _$UsuarioImpl(
      {this.id = "",
      this.nome = "",
      this.email = "",
      this.senha = "",
      this.dataNascimento = "",
      this.perfil = "",
      final List<AlunoTreino> treinos = const []})
      : _treinos = treinos;

  factory _$UsuarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsuarioImplFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String nome;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String senha;
  @override
  @JsonKey()
  final String dataNascimento;
  @override
  @JsonKey()
  final String perfil;
  final List<AlunoTreino> _treinos;
  @override
  @JsonKey()
  List<AlunoTreino> get treinos {
    if (_treinos is EqualUnmodifiableListView) return _treinos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_treinos);
  }

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, email: $email, senha: $senha, dataNascimento: $dataNascimento, perfil: $perfil, treinos: $treinos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsuarioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.dataNascimento, dataNascimento) ||
                other.dataNascimento == dataNascimento) &&
            (identical(other.perfil, perfil) || other.perfil == perfil) &&
            const DeepCollectionEquality().equals(other._treinos, _treinos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nome, email, senha,
      dataNascimento, perfil, const DeepCollectionEquality().hash(_treinos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsuarioImplCopyWith<_$UsuarioImpl> get copyWith =>
      __$$UsuarioImplCopyWithImpl<_$UsuarioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsuarioImplToJson(
      this,
    );
  }
}

abstract class _Usuario implements Usuario {
  factory _Usuario(
      {final String? id,
      final String nome,
      final String email,
      final String senha,
      final String dataNascimento,
      final String perfil,
      final List<AlunoTreino> treinos}) = _$UsuarioImpl;

  factory _Usuario.fromJson(Map<String, dynamic> json) = _$UsuarioImpl.fromJson;

  @override
  String? get id;
  @override
  String get nome;
  @override
  String get email;
  @override
  String get senha;
  @override
  String get dataNascimento;
  @override
  String get perfil;
  @override
  List<AlunoTreino> get treinos;
  @override
  @JsonKey(ignore: true)
  _$$UsuarioImplCopyWith<_$UsuarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
