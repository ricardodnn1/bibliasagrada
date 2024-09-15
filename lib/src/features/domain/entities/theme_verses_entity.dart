base class ThemeVersesEntity {
  ThemeVersesEntity({
    required this.id,
    required this.themeId,
    required this.numberOfVerse,
    required this.bodyText,
  });

  final int id;
  final int themeId;
  final String bodyText;
  final String numberOfVerse;

  @override
  bool operator ==(covariant ThemeVersesEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.themeId == themeId &&
        other.bodyText == bodyText &&
        other.numberOfVerse == numberOfVerse;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      themeId.hashCode ^
      bodyText.hashCode ^
      numberOfVerse.hashCode;
}
