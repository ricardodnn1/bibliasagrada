base class BookEntity {
  final int bookId;
  final String name;
  final String testament;
  final int numberOfChapter;

  BookEntity({
    required this.bookId,
    required this.name,
    required this.testament,
    required this.numberOfChapter,
  });

  @override
  bool operator ==(covariant BookEntity other) {
    if (identical(this, other)) return true;

    return other.bookId == bookId &&
        other.name == name &&
        other.testament == testament &&
        other.numberOfChapter == numberOfChapter;
  }

  @override
  int get hashCode =>
      bookId.hashCode ^
      name.hashCode ^
      testament.hashCode ^
      numberOfChapter.hashCode;
}
