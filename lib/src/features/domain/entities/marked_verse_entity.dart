base class MarkedVerseEntity {
  MarkedVerseEntity({
    required this.chapter,
    required this.bookId,
    required this.numberOfVerses,
    required this.verse,
    required this.bookName,
  });

  final int chapter;
  final int bookId;
  final int numberOfVerses;
  final String verse;
  final String bookName;

  @override
  bool operator ==(covariant MarkedVerseEntity other) {
    if (identical(this, other)) return true;

    return other.bookId == bookId &&
        other.chapter == chapter &&
        other.verse == verse &&
        other.bookName == bookName &&
        other.numberOfVerses == numberOfVerses;
  }

  @override
  int get hashCode =>
      bookId.hashCode ^
      chapter.hashCode ^
      verse.hashCode ^
      bookName.hashCode ^
      numberOfVerses.hashCode;
}
