import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ListBooksUsecase {
  Future<Either<Failure, ListBooksEntity>> call();
}
