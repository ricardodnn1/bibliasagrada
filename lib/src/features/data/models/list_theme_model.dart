import 'package:bibliasagrada/src/features/data/models/theme_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';

final class ListThemeModel extends ListThemeEntity {
  ListThemeModel({
    required super.listTheme,
  });

  factory ListThemeModel.fromMap(Map<String, dynamic> map) {
    final List<ThemeModel> listTheme = [];

    listTheme.addAll(
      (map['Temas'] as List).map(
        (e) => ThemeModel.fromMap(e as Map<String, dynamic>),
      ),
    );

    return ListThemeModel(listTheme: listTheme);
  }
}
