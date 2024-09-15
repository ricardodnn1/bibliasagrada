part of 'list_marked_verses_cubit.dart';

sealed class ListMarkedVersesState extends Equatable {}

final class ListMarkedVersesInitialState extends ListMarkedVersesState {
  @override
  List<Object?> get props => [];
}

final class ListMarkedVersesLoadingState extends ListMarkedVersesState {
  @override
  List<Object?> get props => [];
}

final class ListMarkedVersesEmptyState extends ListMarkedVersesState {
  @override
  List<Object?> get props => [];
}

final class ListMarkedVersesLoadedState extends ListMarkedVersesState {
  ListMarkedVersesLoadedState({
    required this.listMarkedVerseEntity,
  });

  final ListVersesEntity listMarkedVerseEntity;

  ListMarkedVersesLoadedState copyWith({
    ListVersesEntity? listMarkedVerseEntity,
  }) {
    return ListMarkedVersesLoadedState(
      listMarkedVerseEntity:
          listMarkedVerseEntity ?? this.listMarkedVerseEntity,
    );
  }

  @override
  List<Object?> get props => [listMarkedVerseEntity];
}

final class ListMarkedVersesErrorState extends ListMarkedVersesState {
  ListMarkedVersesErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
