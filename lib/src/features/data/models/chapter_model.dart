import 'package:bibliasagrada/src/features/domain/entities/chapter_entity.dart';

final class ChapterModel extends ChapterEntity {
  ChapterModel({
    required super.bookId,
    required super.chapter,
    required super.numberOfVerses,
  });

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      bookId: map['id_livro'],
      chapter: map['numero_capitulo'],
      numberOfVerses: map['qtde_versiculo'],
    );
  }
}
