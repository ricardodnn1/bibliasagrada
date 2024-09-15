import 'package:bibliasagrada/src/features/domain/entities/theme_entity.dart';

final class ThemeModel extends ThemeEntity {
  ThemeModel({
    required super.id,
    required super.description,
  });

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
      id: map['id'],
      description: map['nome'],
    );
  }
}
