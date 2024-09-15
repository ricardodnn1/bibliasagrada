import 'package:bibliasagrada/src/features/data/models/list_theme_verses_model.dart';

abstract interface class ListThemeVersesService {
  Future<ListThemeVersesModel> call({
    required int themeId,
  });
}
