import 'package:bibliasagrada/src/features/data/models/list_theme_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';

abstract interface class ListThemeService {
  Future<ListThemeModel> call();
}
