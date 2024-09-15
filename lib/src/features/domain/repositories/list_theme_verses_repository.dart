﻿import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_verses_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ListThemeVersesRepository {
  Future<Either<Failure, ListThemeVersesEntity>> call({
    required int themeId,
  });
}
