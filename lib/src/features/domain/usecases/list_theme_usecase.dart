import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ListThemeUsecase {
  Future<Either<Failure, ListThemeEntity>> call();
}
