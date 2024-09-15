import 'dart:developer';

import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/models/word_of_the_day_model.dart';
import 'package:bibliasagrada/src/features/data/services/word_of_the_day_service.dart';

final class WordOfTheDayServiceImpl implements WordOfTheDayService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<WordOfTheDayModel> call() async {
    final date = DateTime.now();
    final diff = date.difference(new DateTime(date.year, 1, 1));
    final diffInDays = diff.inDays;

    final dbConnect = db;
    String sql =
        'SELECT p.*, l.nome FROM palavra_dias p, Livros l WHERE l.id = p.id_livro and dia = ${diffInDays}';
    final result = await dbConnect.database.then((conn) => conn.rawQuery(sql));
    log('${result[0]}');
    return WordOfTheDayModel.fromMap(result[0]);
  }
}
