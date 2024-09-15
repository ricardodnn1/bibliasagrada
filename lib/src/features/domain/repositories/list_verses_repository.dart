import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ListVersesRepository {
  Future<Either<Failure, ListVersesEntity>> call({
    required int bookId,
    required int chapterId,
  });
}
