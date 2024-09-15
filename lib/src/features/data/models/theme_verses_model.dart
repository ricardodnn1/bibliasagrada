import 'package:bibliasagrada/src/features/domain/entities/theme_verses_entity.dart';

final class ThemeVersesModel extends ThemeVersesEntity {
  ThemeVersesModel({
    required super.id,
    required super.themeId,
    required super.bodyText,
    required super.numberOfVerse,
  });

  factory ThemeVersesModel.fromMap(Map<String, dynamic> map) {
    return ThemeVersesModel(
      id: map['id'],
      themeId: map['id_tema'],
      bodyText: map['numero_versiculo'],
      numberOfVerse: map['conteudo'],
    );
  }
}
