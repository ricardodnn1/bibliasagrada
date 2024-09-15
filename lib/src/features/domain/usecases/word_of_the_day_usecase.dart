import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/word_of_the_day_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class WordOfTheDayUsecase {
  Future<Either<Failure, WordOfTheDayEntity>> call();
}
