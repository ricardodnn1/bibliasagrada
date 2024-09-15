import 'package:bibliasagrada/src/features/data/models/theme_verses_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_verses_entity.dart';

final class ListThemeVersesModel extends ListThemeVersesEntity {
  ListThemeVersesModel({
    required super.listThemeVerses,
  });

  factory ListThemeVersesModel.fromMap(Map<String, dynamic> map) {
    final List<ThemeVersesModel> listThemeVerses = [];

    listThemeVerses.addAll((map['tema_versiculo'] as List)
        .map((e) => ThemeVersesModel.fromMap(e as Map<String, dynamic>)));

    return ListThemeVersesModel(listThemeVerses: listThemeVerses);
  }
}
