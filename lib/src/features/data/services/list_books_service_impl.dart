import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/book_model.dart';
import 'package:bibliasagrada/src/features/data/models/list_books_model.dart';
import 'package:bibliasagrada/src/features/data/services/list_books_service.dart';

final class ListBooksServiceImpl implements ListBooksService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<ListBooksModel> call() async {
    final dbConnect = db;
    String sql = 'SELECT * FROM Livros';
    final result = await dbConnect.database.then((conn) => conn.rawQuery(sql));
    return ListBooksModel(
      books: result.map((e) => BookModel.fromMap(e)).toList(),
    );
  }
}
