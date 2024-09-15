import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_theme_verses_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_verses_usecase.dart';
import 'package:dartz/dartz.dart';

class ListThemeVersesUsecaseImpl implements ListThemeVersesUsecase {
  ListThemeVersesUsecaseImpl({
    required ListThemeVersesRepository listThemeVersesRepository,
  }) : _listThemeVersesRepository = listThemeVersesRepository;

  final ListThemeVersesRepository _listThemeVersesRepository;

  @override
  Future<Either<Failure, ListThemeVersesEntity>> call({
    required int themeId,
  }) =>
      _listThemeVersesRepository.call(themeId: themeId);
}
