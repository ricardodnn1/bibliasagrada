import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/list_title_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_title_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_title_repository.dart';
import 'package:dartz/dartz.dart';

final class ListTitleRepositoryImpl implements ListTitleRepository {
  ListTitleRepositoryImpl({
    required ListTitleService titleService,
  }) : _titleService = titleService;

  final ListTitleService _titleService;

  @override
  Future<Either<Failure, ListTitleEntity>> call() async {
    try {
      final title = await _titleService();
      return Right(title);
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
