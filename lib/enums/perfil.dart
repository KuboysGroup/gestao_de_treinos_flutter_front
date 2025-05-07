// ignore_for_file: constant_identifier_names

enum Perfil {
  ALUNO("ALUNO"),
  INSTRUTOR("INSTRUTOR");

  final String codigo;

  const Perfil(this.codigo);

  @override
  String toString() {
    return codigo;
  }

  static Perfil? getPorCodigo(String codigo) {
    for (var tipo in Perfil.values) {
      if (tipo.codigo == codigo) {
        return tipo;
      }
    }
    return null;
  }
}
