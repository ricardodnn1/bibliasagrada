part of 'update_marked_verse_cubit.dart';

sealed class UpdateMarkedVerseState extends Equatable {}

final class UpdateMarkedVerseInitialState extends UpdateMarkedVerseState {
  @override
  List<Object?> get props => [];
}

final class UpdateMarkedVerseErrorState extends UpdateMarkedVerseState {
  UpdateMarkedVerseErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

final class UpdateMarkedVerseSuccessState extends UpdateMarkedVerseState {
  UpdateMarkedVerseSuccessState({
    required this.verseEntity,
  });

  final VerseEntity verseEntity;

  UpdateMarkedVerseSuccessState copyWith({
    VerseEntity? verseEntity,
  }) {
    return UpdateMarkedVerseSuccessState(
      verseEntity: verseEntity ?? this.verseEntity,
    );
  }

  @override
  List<Object?> get props => [verseEntity];
}
