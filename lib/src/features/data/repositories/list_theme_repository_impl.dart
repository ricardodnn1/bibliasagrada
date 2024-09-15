import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_theme_repository.dart';
import 'package:dartz/dartz.dart';

final class ListThemeRepositoryImpl implements ListThemeRepository {
  ListThemeRepositoryImpl({
    required this.listThemeService,
  });

  final ListThemeService listThemeService;

  @override
  Future<Either<Failure, ListThemeEntity>> call() async {
    try {
      final listBooks = await listThemeService();
      return Right(listBooks);
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
