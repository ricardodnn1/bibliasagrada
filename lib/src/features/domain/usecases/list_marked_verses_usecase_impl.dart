import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_marked_verse_entity.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_marked_verses_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_marked_verses_usecase.dart';
import 'package:dartz/dartz.dart';

final class ListMarkedVersesUsecaseImpl implements ListMarkedVersesUsecase {
  ListMarkedVersesUsecaseImpl({
    required ListMarkedVersesRepository listMarkedVersesRepository,
  }) : _listMarkedVersesRepository = listMarkedVersesRepository;

  final ListMarkedVersesRepository _listMarkedVersesRepository;

  @override
  Future<Either<Failure, ListVersesEntity>> call() =>
      _listMarkedVersesRepository();
}
