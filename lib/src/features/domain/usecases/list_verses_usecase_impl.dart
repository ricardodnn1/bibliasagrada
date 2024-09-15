import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_verses_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_verses_usecase.dart';
import 'package:dartz/dartz.dart';

final class ListVersesUsecaseImpl implements ListVersesUsecase {
  ListVersesUsecaseImpl({
    required ListVersesRepository listVersesRepository,
  }) : _listVersesRepository = listVersesRepository;

  final ListVersesRepository _listVersesRepository;

  @override
  Future<Either<Failure, ListVersesEntity>> call({
    required int bookId,
    required int chapterId,
  }) =>
      _listVersesRepository(
        bookId: bookId,
        chapterId: chapterId,
      );
}
