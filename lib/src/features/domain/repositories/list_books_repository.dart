import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ListBooksRepository {
  Future<Either<Failure, ListBooksEntity>> call();
}
