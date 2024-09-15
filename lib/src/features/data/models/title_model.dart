import 'package:bibliasagrada/src/features/domain/entities/title_entity.dart';

final class TitleModel extends TitleEntity {
  TitleModel({
    required super.id,
    required super.textTitle,
    required super.bookId,
    required super.chapter,
    required super.numberOfVerse,
    required super.category,
  });

  factory TitleModel.fromMap(Map<String, dynamic> map) {
    return TitleModel(
      id: map['id'] ?? 1,
      textTitle: map['texto'] ?? 1,
      bookId: map['id_livro'] ?? 1,
      chapter: map['id_capitulo'] ?? 1,
      numberOfVerse: map['numero_versiculo'] ?? 1,
      category: map['categoria'] ?? 'T',
    );
  }
}
