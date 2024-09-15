import 'package:bibliasagrada/src/features/domain/entities/book_entity.dart';

final class BookModel extends BookEntity {
  BookModel({
    required super.bookId,
    required super.name,
    required super.testament,
    required super.numberOfChapter,
  });

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      bookId: map['id'],
      name: map['nome'],
      testament: map['testamento'],
      numberOfChapter: map['qtde_capitulo'],
    );
  }
}
