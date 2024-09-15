import 'package:bibliasagrada/src/features/domain/entities/word_of_the_day_entity.dart';

final class WordOfTheDayModel extends WordOfTheDayEntity {
  WordOfTheDayModel({
    required super.chapter,
    required super.bookId,
    required super.day,
    required super.numberOfVerses,
    required super.verse,
    required super.bookName,
  });

  factory WordOfTheDayModel.fromMap(Map<String, dynamic> map) {
    return WordOfTheDayModel(
      chapter: map['id_capitulo'],
      bookId: map['id_livro'],
      day: map['dia'],
      numberOfVerses: map['numero_versiculo'],
      verse: map['texto_versiculo'],
      bookName: map['nome'],
    );
  }
}
