import 'package:bibliasagrada/src/features/domain/entities/list_theme_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_theme_state.dart';

final class ListThemeCubit extends Cubit<ListThemeState> {
  ListThemeCubit({
    required this.listThemeUsecase,
  }) : super(ListThemeInitialState());

  final ListThemeUsecase listThemeUsecase;

  Future<void> getListTheme() async {
    emit(ListThemeLoadingState());
    final usecase = await listThemeUsecase();

    usecase.fold(
      (l) => emit(
        ListThemeErrorState(message: l.message!),
      ),
      (r) => emit(
        ListThemeLoadedState(listThemeEntity: r),
      ),
    );
  }
}
