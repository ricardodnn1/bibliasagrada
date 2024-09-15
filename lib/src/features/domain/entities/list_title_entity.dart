import 'package:bibliasagrada/src/features/domain/entities/title_entity.dart';
import 'package:flutter/foundation.dart';

base class ListTitleEntity {
  ListTitleEntity({required this.listTitle});

  List<TitleEntity> listTitle;

  @override
  bool operator ==(covariant ListTitleEntity other) {
    if (identical(this, other)) return true;

    return listEquals(other.listTitle, listTitle);
  }

  @override
  int get hashCode => Object.hashAll(listTitle);
}
