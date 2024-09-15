part of 'theme_verses_cubit.dart';

sealed class ThemeVersesState extends Equatable {}

final class ThemeVersesInitialState extends ThemeVersesState {
  @override
  List<Object?> get props => [];
}

final class ThemeVersesLoadingState extends ThemeVersesState {
  @override
  List<Object?> get props => [];
}

final class ThemeVersesLoadedState extends ThemeVersesState {
  ThemeVersesLoadedState({
    required this.listThemeVersesEntity,
  });

  final ListThemeVersesEntity listThemeVersesEntity;

  @override
  List<Object?> get props => [listThemeVersesEntity];
}

final class ThemeVersesErrorState extends ThemeVersesState {
  ThemeVersesErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
