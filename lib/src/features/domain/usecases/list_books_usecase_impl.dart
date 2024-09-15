import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_books_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_books_usecase.dart';
import 'package:dartz/dartz.dart';

final class ListBooksUsecaseImpl implements ListBooksUsecase {
  ListBooksUsecaseImpl({
    required ListBooksRepository listBooksRepository,
  }) : _listBooksRepository = listBooksRepository;

  final ListBooksRepository _listBooksRepository;

  @override
  Future<Either<Failure, ListBooksEntity>> call() => _listBooksRepository();
}
