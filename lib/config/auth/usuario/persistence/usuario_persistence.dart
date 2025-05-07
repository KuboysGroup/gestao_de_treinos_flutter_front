import 'package:gestao_de_treinos_flutter_front/models/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioPersistence {
  static const String _idKey = 'userId';
  static const String _emailKey = 'userEmail';
  static const String _senhaKey = 'userSenha';
  static const String _nomeKey = 'userNome';
  static const String _perfilKey = 'userPerfil';

  static Future<void> write(Usuario userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_idKey, userData.id!);
    await prefs.setString(_emailKey, userData.email);
    await prefs.setString(_senhaKey, userData.senha);
    await prefs.setString(_nomeKey, userData.nome);
    await prefs.setString(_perfilKey, userData.perfil);
  }

  static Future<Usuario?> read() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int? id = prefs.getInt(_idKey);
    final String? email = prefs.getString(_emailKey);
    final String? senha = prefs.getString(_senhaKey);
    final String? nome = prefs.getString(_nomeKey);
    final String? perfil = prefs.getString(_perfilKey);

    if (id != null &&
        email != null &&
        senha != null &&
        nome != null &&
        perfil != null) {
      return Usuario(
          id: id, email: email, senha: senha, nome: nome, perfil: perfil);
    } else {
      return null;
    }
  }

  static Future<void> remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_idKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_senhaKey);
    await prefs.remove(_nomeKey);
    await prefs.remove(_perfilKey);
  }
}
