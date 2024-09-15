import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/update_marked_verse_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/update_marked_verse_repository.dart';
import 'package:dartz/dartz.dart';

final class UpdateMarkedVerseRepositoryImpl
    implements UpdateMarkedVerseRepository {
  UpdateMarkedVerseRepositoryImpl({
    required this.updateMarkedVerseService,
  });

  final UpdateMarkedVerseService updateMarkedVerseService;

  @override
  Future<Either<Failure, VerseEntity>> call({
    required VerseEntity verseEntity,
  }) async {
    try {
      final update = await updateMarkedVerseService(verseEntity: verseEntity);
      return Right(update);
    } catch (e) {
      return Left(
        Failure(
          exception: e.runtimeType,
          message: e.toString(),
          statusCode: e.hashCode,
        ),
      );
    }
  }
}
