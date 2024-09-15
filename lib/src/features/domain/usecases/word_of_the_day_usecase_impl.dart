import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/domain/entities/word_of_the_day_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/word_of_the_day_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/word_of_the_day_usecase.dart';
import 'package:dartz/dartz.dart';

final class WordOfTheDayUsecaseImpl implements WordOfTheDayUsecase {
  WordOfTheDayUsecaseImpl({
    required WordOfTheDayRepository wordOfTheDayRepository,
  }) : _wordOfTheDayRepository = wordOfTheDayRepository;

  final WordOfTheDayRepository _wordOfTheDayRepository;

  @override
  Future<Either<Failure, WordOfTheDayEntity>> call() {
    return _wordOfTheDayRepository();
  }
}
