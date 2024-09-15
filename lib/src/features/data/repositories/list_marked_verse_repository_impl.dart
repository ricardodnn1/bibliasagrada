import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/list_marked_verses_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_marked_verses_repository.dart';
import 'package:dartz/dartz.dart';

final class ListMarkedVersesRepositoryImpl
    implements ListMarkedVersesRepository {
  ListMarkedVersesRepositoryImpl({
    required this.listMarkedVersesService,
  });

  final ListMarkedVersesService listMarkedVersesService;

  @override
  Future<Either<Failure, ListVersesEntity>> call() async {
    try {
      final listMarkedVerses = await listMarkedVersesService();
      return Right(listMarkedVerses);
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
