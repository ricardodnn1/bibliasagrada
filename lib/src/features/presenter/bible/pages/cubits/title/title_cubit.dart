import 'package:bibliasagrada/src/features/domain/entities/title_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_title_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'title_state.dart';

final class TitleCubit extends Cubit<TitleState> {
  TitleCubit({
    required ListTitleUsecase titleUsecase,
  })  : _titleUsecase = titleUsecase,
        super(TitleInitialState());

  final ListTitleUsecase _titleUsecase;

  Future<void> getAllTitle() async {
    //emit(TitleLoadingState());

    final usecase = await _titleUsecase();

    usecase.fold((l) => emit(TitleErrorState(message: l.message!)), (r) {
      emit(TitleLoadedState(listTitleEntity: r.listTitle));
    });
  }

  Future<List<TitleEntity>> getTitle({
    required int bookId,
    required int chapterId,
    required int numberVerse,
  }) async {
    final stateLoaded = (state as TitleLoadedState);
    List<TitleEntity> listTitle = stateLoaded.listTitleEntity
        .where((e) =>
            e.bookId == bookId &&
            e.chapter == chapterId &&
            e.numberOfVerse == numberVerse)
        .toList();
    return listTitle;
  }
}
