import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class UpdateMarkedVerseRepository {
  Future<Either<Failure, VerseEntity>> call({
    required VerseEntity verseEntity,
  });
}
