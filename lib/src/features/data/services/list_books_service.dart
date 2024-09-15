import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';

abstract interface class ListBooksService {
  Future<ListBooksEntity> call();
}
