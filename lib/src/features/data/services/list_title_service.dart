import 'package:bibliasagrada/src/features/data/models/list_title_model.dart';

abstract interface class ListTitleService {
  Future<ListTitleModel> call();
}
