import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/update_marked_verse_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_marked_verse_state.dart';

final class UpdateMarkedVerseCubit extends Cubit<UpdateMarkedVerseState> {
  UpdateMarkedVerseCubit({
    required UpdateMarkedVerseUsecase updateMarkedVerseUsecase,
  })  : _updateMarkedVerseUsecase = updateMarkedVerseUsecase,
        super(UpdateMarkedVerseInitialState());

  final UpdateMarkedVerseUsecase _updateMarkedVerseUsecase;

  Future<void> updateMarkedVerse({
    required VerseEntity verseEntity,
  }) async {
    final update = await _updateMarkedVerseUsecase(verseEntity: verseEntity);
    update.fold(
      (l) => emit(UpdateMarkedVerseErrorState(message: l.message!)),
      (r) => emit(
        UpdateMarkedVerseSuccessState(verseEntity: r),
      ),
    );
  }
}
