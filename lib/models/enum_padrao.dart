// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'enum_padrao.freezed.dart';
part 'enum_padrao.g.dart';

@freezed
class EnumPadrao with _$EnumPadrao {
  factory EnumPadrao(
      {required String ENUM,
      required String LABEL,
      required String codigo,
      required String descricao}) = _EnumPadrao;

  factory EnumPadrao.fromJson(Map<String, Object?> json) =>
      _$EnumPadraoFromJson(json);
}
