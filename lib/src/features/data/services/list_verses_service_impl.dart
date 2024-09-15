import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/list_verses_model.dart';
import 'package:bibliasagrada/src/features/data/models/verse_model.dart';
import 'package:bibliasagrada/src/features/data/services/list_verses_service.dart';

final class ListVersesServiceImpl implements ListVersesService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<ListVersesModel> call(int bookId, int chapterId) async {
    final dbConnect = db;
    String sql =
        'SELECT * FROM Versiculos WHERE id_livro = $bookId and id_capitulo = $chapterId';
    final result = await dbConnect.database.then((conn) => conn.rawQuery(sql));

    return ListVersesModel(
      listVerses: result.map((e) => VerseModel.fromMap(e)).toList(),
    );
  }
}
