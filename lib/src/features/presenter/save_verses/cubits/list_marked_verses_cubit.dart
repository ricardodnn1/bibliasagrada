import 'package:bibliasagrada/src/features/domain/entities/list_marked_verse_entity.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_marked_verses_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_marked_verses_state.dart';

class ListMarkedVersesCubit extends Cubit<ListMarkedVersesState> {
  ListMarkedVersesCubit({
    required this.listMarkedVersesUsecase,
  }) : super(ListMarkedVersesInitialState());

  final ListMarkedVersesUsecase listMarkedVersesUsecase;

  Future<void> getListMarkedVerses() async {
    emit(ListMarkedVersesLoadingState());

    final usecase = await listMarkedVersesUsecase();

    usecase.fold(
        (l) => emit(
              ListMarkedVersesErrorState(message: l.message!),
            ), (r) {
      if (r.listVerses.isEmpty) {
        emit(ListMarkedVersesEmptyState());
      } else {
        emit(ListMarkedVersesLoadedState(listMarkedVerseEntity: r));
      }
    });
  }

  Future<void> updateListMarkedVerses() async {
    final listMarkedVerseState = (state as ListMarkedVersesLoadedState);

    final usecase = await listMarkedVersesUsecase();

    usecase.fold(
      (l) => emit(
        ListMarkedVersesErrorState(message: l.message!),
      ),
      (r) {
        if (r.listVerses.isEmpty) {
          emit(ListMarkedVersesEmptyState());
        } else {
          emit(listMarkedVerseState.copyWith(listMarkedVerseEntity: r));
        }
      },
    );
  }
}
