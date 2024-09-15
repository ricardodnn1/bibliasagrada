part of 'list_theme_cubit.dart';

sealed class ListThemeState extends Equatable {}

final class ListThemeInitialState extends ListThemeState {
  @override
  List<Object?> get props => [];
}

final class ListThemeLoadingState extends ListThemeState {
  @override
  List<Object?> get props => [];
}

final class ListThemeLoadedState extends ListThemeState {
  ListThemeLoadedState({
    required this.listThemeEntity,
  });

  final ListThemeEntity listThemeEntity;

  @override
  List<Object?> get props => [listThemeEntity];
}

final class ListThemeErrorState extends ListThemeState {
  ListThemeErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
