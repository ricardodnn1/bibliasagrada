import 'package:bibliasagrada/src/features/domain/entities/list_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_verses_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_verses_state.dart';

final class ListVersesCubit extends Cubit<ListVersesState> {
  ListVersesCubit({
    required this.listVersesUsecase,
  }) : super(ListVersesInitialState());

  final ListVersesUsecase listVersesUsecase;

  Future<void> getListVerses({
    int? bookId,
    int? chapterId,
  }) async {
    emit(ListVersesLoadingState());

    final usecase = await listVersesUsecase(
      bookId: bookId!,
      chapterId: chapterId!,
    );

    usecase.fold(
      (l) => emit(
        ListVersesErrorState(message: l.message!),
      ),
      (r) => emit(
        ListVersesLoadedState(listVersesEntity: r),
      ),
    );
  }

  Future<void> updateListVerses({
    int? bookId,
    int? chapterId,
  }) async {
    final listVerseState = (state as ListVersesLoadedState);
    final usecase = await listVersesUsecase(
      bookId: bookId!,
      chapterId: chapterId!,
    );

    usecase.fold(
      (l) => emit(
        ListVersesErrorState(message: l.message!),
      ),
      (r) => emit(listVerseState.copyWith(listVersesEntity: r)),
    );
  }
}
