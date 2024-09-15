import 'package:bibliasagrada/src/features/domain/entities/marked_verse_entity.dart';
import 'package:flutter/foundation.dart';

base class ListMarkedVerseEntity {
  ListMarkedVerseEntity({
    required this.listMarkedVerse,
  });

  final List<MarkedVerseEntity> listMarkedVerse;

  @override
  bool operator ==(covariant ListMarkedVerseEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.listMarkedVerse, listMarkedVerse);
  }

  @override
  int get hashCode => Object.hashAll(listMarkedVerse);
}
