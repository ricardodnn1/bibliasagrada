base class TitleEntity {
  TitleEntity({
    required this.id,
    required this.textTitle,
    required this.bookId,
    required this.chapter,
    required this.numberOfVerse,
    required this.category,
  });

  final int id;
  final String textTitle;
  final int bookId;
  final int chapter;
  final int numberOfVerse;
  final String category;

  @override
  bool operator ==(covariant TitleEntity other) {
    if (identical(this, other)) return true;

    return other.bookId == bookId &&
        other.chapter == chapter &&
        other.textTitle == textTitle &&
        other.numberOfVerse == numberOfVerse &&
        other.category == category &&
        other.id == id;
  }

  @override
  int get hashCode =>
      bookId.hashCode ^
      chapter.hashCode ^
      id.hashCode ^
      textTitle.hashCode ^
      category.hashCode ^
      numberOfVerse.hashCode;
}
