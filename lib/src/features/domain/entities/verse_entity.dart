base class VerseEntity {
  VerseEntity({
    required this.id,
    required this.bookId,
    required this.chapterId,
    required this.verseNumber,
    required this.verse,
    required this.colorId,
    required this.markedVerse,
    this.bookName,
  });

  final int id;
  final int bookId;
  final int chapterId;
  final int verseNumber;
  final String verse;
  final int colorId;
  final int markedVerse;
  final String? bookName;

  @override
  bool operator ==(covariant VerseEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.bookId == bookId &&
        other.chapterId == chapterId &&
        other.verseNumber == verseNumber &&
        other.verse == verse &&
        other.colorId == colorId &&
        other.markedVerse == markedVerse &&
        other.bookName == bookName;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      bookId.hashCode ^
      chapterId.hashCode ^
      verseNumber.hashCode ^
      verse.hashCode ^
      markedVerse.hashCode ^
      colorId.hashCode ^
      bookName.hashCode;

  bool get marked => markedVerse == 1 && chapterId != 0 ? true : false;

  String get fullVerse => "${verse.substring(0, 2)}- ${verse.substring(2)}";
}
