import 'package:bibliasagrada/src/features/data/models/list_verses_model.dart';

abstract interface class ListMarkedVersesService {
  Future<ListVersesModel> call();
}
