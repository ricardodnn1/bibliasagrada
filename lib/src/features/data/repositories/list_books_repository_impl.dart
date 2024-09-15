import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/list_books_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_books_repository.dart';
import 'package:dartz/dartz.dart';

final class ListBooksRepositoryImpl implements ListBooksRepository {
  ListBooksRepositoryImpl({
    required this.listBooksService,
  });

  final ListBooksService listBooksService;

  @override
  Future<Either<Failure, ListBooksEntity>> call() async {
    try {
      final listBooks = await listBooksService();
      return Right(listBooks);
    } catch (error) {
      return Left(
        Failure(
          statusCode: error.hashCode,
          exception: error,
          message: 'Error!',
        ),
      );
    }
  }
}
