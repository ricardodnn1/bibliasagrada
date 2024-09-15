import 'package:bibliasagrada/src/features/data/models/book_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';

final class ListBooksModel extends ListBooksEntity {
  ListBooksModel({
    required super.books,
  });

  factory ListBooksModel.fromMap(Map<String, dynamic> map) {
    final List<BookModel> books = [];

    books.addAll((map['Livros'] as List)
        .map((e) => BookModel.fromMap(e as Map<String, dynamic>)));

    return ListBooksModel(books: books);
  }
}
