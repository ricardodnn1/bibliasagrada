import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_title_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_title_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_title_usecase.dart';
import 'package:dartz/dartz.dart';

final class ListTitleUsecaseImpl implements ListTitleUsecase {
  ListTitleUsecaseImpl({
    required ListTitleRepository titleRepository,
  }) : _titleRepository = titleRepository;

  final ListTitleRepository _titleRepository;

  @override
  Future<Either<Failure, ListTitleEntity>> call() {
    return _titleRepository();
  }
}
