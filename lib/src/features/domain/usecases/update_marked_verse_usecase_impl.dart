import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/update_marked_verse_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/update_marked_verse_usecase.dart';
import 'package:dartz/dartz.dart';

final class UpdateMarkedVerseUsecaseImpl implements UpdateMarkedVerseUsecase {
  UpdateMarkedVerseUsecaseImpl({
    required UpdateMarkedVerseRepository updateMarkedVerseRepository,
  }) : _updateMarkedVerseRepository = updateMarkedVerseRepository;

  final UpdateMarkedVerseRepository _updateMarkedVerseRepository;

  @override
  Future<Either<Failure, VerseEntity>> call({
    required VerseEntity verseEntity,
  }) {
    return _updateMarkedVerseRepository(verseEntity: verseEntity);
  }
}
