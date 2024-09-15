import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_theme_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_usecase.dart';
import 'package:dartz/dartz.dart';

final class ListThemeUsecaseImpl implements ListThemeUsecase {
  ListThemeUsecaseImpl({
    required ListThemeRepository listThemeRepository,
  }) : _listThemeRepository = listThemeRepository;

  final ListThemeRepository _listThemeRepository;

  @override
  Future<Either<Failure, ListThemeEntity>> call() => _listThemeRepository();
}
