import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/list_verses_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_verses_repository.dart';
import 'package:dartz/dartz.dart';

final class ListVersesRepositoryImpl implements ListVersesRepository {
  ListVersesRepositoryImpl({
    required this.listVersesService,
  });

  final ListVersesService listVersesService;

  @override
  Future<Either<Failure, ListVersesEntity>> call({
    required int bookId,
    required int chapterId,
  }) async {
    try {
      final listVerses = await listVersesService(bookId, chapterId);
      return Right(listVerses);
    } catch (error) {
      return Left(
        Failure(
          statusCode: error.hashCode,
          exception: error,
          message: 'Error!',
        ),
      );
    }
  }
}
