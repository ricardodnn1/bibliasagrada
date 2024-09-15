base class ThemeEntity {
  ThemeEntity({
    required this.id,
    required this.description,
  });

  final int id;
  final String description;

  @override
  bool operator ==(covariant ThemeEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode;
}
