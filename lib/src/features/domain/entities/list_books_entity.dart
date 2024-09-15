import 'package:bibliasagrada/src/features/domain/entities/book_entity.dart';
import 'package:flutter/foundation.dart';

base class ListBooksEntity {
  ListBooksEntity({
    required this.books,
  });

  final List<BookEntity> books;

  @override
  bool operator ==(covariant ListBooksEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.books, books);
  }

  @override
  int get hashCode => Object.hashAll(books);
}
