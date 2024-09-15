import 'package:bibliasagrada/src/features/domain/entities/marked_verse_entity.dart';

final class MarkedVerseModel extends MarkedVerseEntity {
  MarkedVerseModel({
    required super.chapter,
    required super.bookId,
    required super.numberOfVerses,
    required super.verse,
    required super.bookName,
  });

  factory MarkedVerseModel.fromMap(Map<String, dynamic> map) {
    return MarkedVerseModel(
      chapter: map['id_capitulo'],
      bookId: map['id_livro'],
      numberOfVerses: map['numero_versiculo'],
      verse: map['texto_versiculo'],
      bookName: map['nome'],
    );
  }
}
