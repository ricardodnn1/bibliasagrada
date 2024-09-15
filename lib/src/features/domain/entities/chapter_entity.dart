base class ChapterEntity {
  final int bookId;
  final int chapter;
  final int numberOfVerses;

  ChapterEntity({
    required this.bookId,
    required this.chapter,
    required this.numberOfVerses,
  });

  @override
  bool operator ==(covariant ChapterEntity other) {
    if (identical(this, other)) return true;

    return other.bookId == bookId &&
        other.chapter == chapter &&
        other.numberOfVerses == numberOfVerses;
  }

  @override
  int get hashCode =>
      bookId.hashCode ^ chapter.hashCode ^ numberOfVerses.hashCode;
}
