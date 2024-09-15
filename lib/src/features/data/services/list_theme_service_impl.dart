import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/list_theme_model.dart';
import 'package:bibliasagrada/src/features/data/models/theme_model.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';

final class ListThemeServiceImpl implements ListThemeService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<ListThemeModel> call() async {
    final dbConnect = db;
    String sql = 'SELECT * FROM Temas';
    final result = await dbConnect.database.then((conn) => conn.rawQuery(sql));
    return ListThemeModel(
      listTheme: result.map((e) => ThemeModel.fromMap(e)).toList(),
    );
  }
}
