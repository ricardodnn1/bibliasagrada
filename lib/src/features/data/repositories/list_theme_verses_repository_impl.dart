import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_verses_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_theme_verses_repository.dart';
import 'package:dartz/dartz.dart';

final class ListThemeVersesRepositoryImpl implements ListThemeVersesRepository {
  ListThemeVersesRepositoryImpl({
    required this.listThemeVersesService,
  });

  final ListThemeVersesService listThemeVersesService;

  @override
  Future<Either<Failure, ListThemeVersesEntity>> call(
      {required int themeId}) async {
    try {
      final listThemeVerses = await listThemeVersesService(themeId: themeId);
      return Right(listThemeVerses);
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
