part of 'list_verses_cubit.dart';

sealed class ListVersesState extends Equatable {}

final class ListVersesInitialState extends ListVersesState {
  @override
  List<Object?> get props => [];
}

final class ListVersesLoadingState extends ListVersesState {
  @override
  List<Object?> get props => [];
}

final class ListVersesErrorState extends ListVersesState {
  ListVersesErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ListVersesLoadedState extends ListVersesState {
  ListVersesLoadedState({
    required this.listVersesEntity,
  });

  final ListVersesEntity listVersesEntity;

  ListVersesLoadedState copyWith({
    ListVersesEntity? listVersesEntity,
  }) {
    return ListVersesLoadedState(
      listVersesEntity: listVersesEntity ?? this.listVersesEntity,
    );
  }

  @override
  List<Object?> get props => [listVersesEntity];
}
