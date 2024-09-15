import 'package:bibliasagrada/src/features/data/models/title_model.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_title_entity.dart';

final class ListTitleModel extends ListTitleEntity {
  ListTitleModel({
    required super.listTitle,
  });

  factory ListTitleModel.fromMap(Map<String, dynamic> map) {
    final List<TitleModel> listTitle = [];

    listTitle.addAll((map['Titulos'] as List)
        .map((e) => TitleModel.fromMap(e as Map<String, dynamic>)));

    return ListTitleModel(listTitle: listTitle);
  }
}
