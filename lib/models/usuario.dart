import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gestao_de_treinos_flutter_front/models/aluno_treino.dart';

part 'usuario.freezed.dart';
part 'usuario.g.dart';

@freezed
class Usuario with _$Usuario {
  factory Usuario({
    @Default("") String? id,
    @Default("") String nome,
    @Default("") String email,
    @Default("") String senha,
    @Default("") String dataNascimento,
    @Default("") String perfil,
    @Default([]) List<AlunoTreino> treinos,
  }) = _Usuario;

  factory Usuario.fromJson(Map<String, Object?> json) =>
      _$UsuarioFromJson(json);
}
