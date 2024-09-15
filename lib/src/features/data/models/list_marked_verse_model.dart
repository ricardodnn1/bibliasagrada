import 'package:bibliasagrada/src/features/data/models/marked_verse_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_marked_verse_entity.dart';

final class ListMarkedVerseModel extends ListMarkedVerseEntity {
  ListMarkedVerseModel({
    required super.listMarkedVerse,
  });

  factory ListMarkedVerseModel.fromMap(Map<String, dynamic> map) {
    final List<MarkedVerseModel> listMarkedVerse = [];

    listMarkedVerse.addAll((map['Livros'] as List)
        .map((e) => MarkedVerseModel.fromMap(e as Map<String, dynamic>)));

    return ListMarkedVerseModel(listMarkedVerse: listMarkedVerse);
  }
}
