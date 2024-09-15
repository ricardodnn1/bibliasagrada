import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';

abstract interface class UpdateMarkedVerseService {
  Future<VerseEntity> call({
    required VerseEntity verseEntity,
  });
}
