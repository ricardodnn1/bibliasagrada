import 'package:bibliasagrada/src/features/domain/entities/theme_verses_entity.dart';
import 'package:flutter/foundation.dart';

base class ListThemeVersesEntity {
  ListThemeVersesEntity({
    required this.listThemeVerses,
  });

  final List<ThemeVersesEntity> listThemeVerses;

  @override
  bool operator ==(covariant ListThemeVersesEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.listThemeVerses, listThemeVerses);
  }

  @override
  int get hashCode => Object.hashAll(listThemeVerses);
}
