import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';

final class VerseModel extends VerseEntity {
  VerseModel({
    required super.id,
    required super.bookId,
    required super.chapterId,
    required super.verseNumber,
    required super.verse,
    required super.colorId,
    required super.markedVerse,
    super.bookName,
  });

  factory VerseModel.fromMap(Map<String, dynamic> map) {
    return VerseModel(
      id: map['id'],
      bookId: map['id_livro'],
      chapterId: map['id_capitulo'],
      verseNumber: map['numero_versiculo'],
      verse: map['texto_versiculo'],
      markedVerse: map['versiculo_marcado'],
      colorId: map['id_cor'],
      bookName: map['nome'] ?? '',
    );
  }
}
