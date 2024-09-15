import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:flutter/foundation.dart';

base class ListVersesEntity {
  ListVersesEntity({
    required this.listVerses,
  });

  final List<VerseEntity> listVerses;

  @override
  bool operator ==(covariant ListVersesEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.listVerses, listVerses);
  }

  @override
  int get hashCode => Object.hashAll(listVerses);
}
