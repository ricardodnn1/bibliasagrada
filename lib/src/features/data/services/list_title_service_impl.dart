import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/list_title_model.dart';
import 'package:bibliasagrada/src/features/data/models/title_model.dart';
import 'package:bibliasagrada/src/features/data/services/list_title_service.dart';

final class ListTitleServiceImpl implements ListTitleService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<ListTitleModel> call() async {
    try {
      final dbConnect = db;
      String sql = 'SELECT DISTINCT * FROM Titulos';
      final result =
          await dbConnect.database.then((conn) => conn.rawQuery(sql));

      if (result.isNotEmpty) {
        return ListTitleModel(
          listTitle: result.map((e) => TitleModel.fromMap(e)).toList(),
        );
      } else {
        return ListTitleModel(listTitle: []);
      }
    } catch (e) {
      return ListTitleModel(listTitle: []);
    }
  }
}
