import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_chapter_state.dart';

class SelectedChapterCubit extends Cubit<SelectedChapterState> {
  SelectedChapterCubit() : super(SelectedChapterInitialState());

  Future<void> selectedChapter({
    required int changed,
  }) async {
    emit(SelectedChapterChangeState(
      selectedChapter: changed,
    ));
  }
}
