import 'package:bibliasagrada/src/features/domain/entities/theme_entity.dart';
import 'package:flutter/foundation.dart';

base class ListThemeEntity {
  ListThemeEntity({required this.listTheme});

  List<ThemeEntity> listTheme;

  @override
  bool operator ==(covariant ListThemeEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.listTheme, listTheme);
  }

  @override
  int get hashCode => Object.hashAll(listTheme);
}
