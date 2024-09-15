import 'package:bibliasagrada/src/features/data/models/verse_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';

final class ListVersesModel extends ListVersesEntity {
  ListVersesModel({
    required super.listVerses,
  });

  factory ListVersesModel.fromMap(Map<String, dynamic> map) {
    final List<VerseModel> listVerses = [];

    if (map['listVerses'] != null) {
      listVerses.addAll((map['Versiculo'] as List)
          .map((e) => VerseModel.fromMap(e as Map<String, dynamic>)));
    }

    return ListVersesModel(listVerses: listVerses);
  }
}
