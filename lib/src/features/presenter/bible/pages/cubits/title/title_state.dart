part of 'title_cubit.dart';

sealed class TitleState extends Equatable {}

final class TitleInitialState extends TitleState {
  @override
  List<Object?> get props => [];
}

final class TitleLoadingState extends TitleState {
  @override
  List<Object?> get props => [];
}

final class TitleErrorState extends TitleState {
  TitleErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [];
}

final class TitleLoadedState extends TitleState {
  TitleLoadedState({
    required this.listTitleEntity,
  });

  final List<TitleEntity> listTitleEntity;

  TitleLoadedState copyWith({
    List<TitleEntity>? listTitleEntity,
  }) {
    return TitleLoadedState(
      listTitleEntity: listTitleEntity ?? this.listTitleEntity,
    );
  }

  @override
  List<Object?> get props => [listTitleEntity];
}
