import 'package:bibliasagrada/src/features/domain/entities/word_of_the_day_entity.dart';

abstract interface class WordOfTheDayService {
  Future<WordOfTheDayEntity> call();
}
