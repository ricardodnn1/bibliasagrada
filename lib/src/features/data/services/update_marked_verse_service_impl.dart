import 'dart:developer';

import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/services/update_marked_verse_service.dart';
import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';

final class UpdateMarkedVerseServiceImpl implements UpdateMarkedVerseService {
  DatabaseHelper db = DatabaseHelper();

  @override
  Future<VerseEntity> call({
    required VerseEntity verseEntity,
  }) async {
    final dbConnect = db;

    final result = await dbConnect.database.then(
      (conn) => conn.update(
        'Versiculos',
        {
          'versiculo_marcado': verseEntity.markedVerse,
          'id_cor': verseEntity.colorId,
        },
        where: 'id = ?',
        whereArgs: [verseEntity.id],
      ),
    );

    log(result.toString());
    return verseEntity;
  }
}
