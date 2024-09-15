import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/list_verses_model.dart';
import 'package:bibliasagrada/src/features/data/models/verse_model.dart';
import 'list_marked_verses_service.dart';

class ListMarkedVersesServiceImpl implements ListMarkedVersesService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<ListVersesModel> call() async {
    final dbConnect = db;
    String sql =
        'SELECT v.*, l.nome FROM Versiculos v, Livros l WHERE v.id_livro = l.id and v.versiculo_marcado = 1';
    final result = await dbConnect.database.then((conn) => conn.rawQuery(sql));

    return ListVersesModel(
      listVerses: result.map((e) => VerseModel.fromMap(e)).toList(),
    );
  }
}
