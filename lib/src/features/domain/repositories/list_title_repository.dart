import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_title_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class ListTitleRepository {
  Future<Either<Failure, ListTitleEntity>> call();
}
