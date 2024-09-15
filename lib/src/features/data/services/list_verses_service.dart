import 'package:bibliasagrada/src/features/data/models/list_verses_model.dart';

abstract interface class ListVersesService {
  Future<ListVersesModel> call(int bookId, int chapterId);
}
