import 'package:bibliasagrada/src/features/domain/entities/list_theme_verses_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_verses_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_verses_state.dart';

class ThemeVersesCubit extends Cubit<ThemeVersesState> {
  ThemeVersesCubit({
    required this.listThemeVersesUsecase,
  }) : super(ThemeVersesInitialState());

  final ListThemeVersesUsecase listThemeVersesUsecase;

  Future<void> getVerses({
    required int theme,
  }) async {
    emit(ThemeVersesLoadingState());

    final usecase = await listThemeVersesUsecase(themeId: theme);
    usecase.fold(
      (l) => emit(ThemeVersesErrorState(message: l.message!)),
      (r) => emit(ThemeVersesLoadedState(listThemeVersesEntity: r)),
    );
  }
}
