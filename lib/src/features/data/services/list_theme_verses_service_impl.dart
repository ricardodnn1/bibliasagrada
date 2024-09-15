import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/list_theme_verses_model.dart';
import 'package:bibliasagrada/src/features/data/models/theme_verses_model.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_verses_service.dart';

final class ListThemeVersesServiceImpl implements ListThemeVersesService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<ListThemeVersesModel> call({
    required int themeId,
  }) async {
    final dbConnect = db;
    String sql = 'SELECT * FROM tema_versiculos WHERE id_tema = $themeId';
    final result = await dbConnect.database.then((conn) => conn.rawQuery(sql));
    return ListThemeVersesModel(
      listThemeVerses: result.map((e) => ThemeVersesModel.fromMap(e)).toList(),
    );
  }
}
