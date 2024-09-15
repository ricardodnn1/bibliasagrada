import 'package:bibliasagrada/shared/core/failure.dart';
import 'package:bibliasagrada/src/features/data/services/word_of_the_day_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/word_of_the_day_entity.dart';
import 'package:bibliasagrada/src/features/domain/repositories/word_of_the_day_repository.dart';
import 'package:dartz/dartz.dart';

final class WordOfTheDayRepositoryImpl implements WordOfTheDayRepository {
  WordOfTheDayRepositoryImpl({
    required this.wordOfTheDayService,
  });

  final WordOfTheDayService wordOfTheDayService;

  @override
  Future<Either<Failure, WordOfTheDayEntity>> call() async {
    try {
      final wordOfTheDay = await wordOfTheDayService();
      return Right(wordOfTheDay);
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
