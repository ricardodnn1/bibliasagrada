part of 'word_of_the_day_cubit.dart';

sealed class WordOfTheDayState extends Equatable {}

final class WordOfTheDayInitialState extends WordOfTheDayState {
  @override
  List<Object?> get props => [];
}

final class WordOfTheDayLoadingState extends WordOfTheDayState {
  @override
  List<Object?> get props => [];
}

final class WordOfTheDayLoadedState extends WordOfTheDayState {
  WordOfTheDayLoadedState({
    required this.wordOfTheDayEntity,
  });

  final WordOfTheDayEntity wordOfTheDayEntity;

  @override
  List<Object?> get props => [wordOfTheDayEntity];
}

final class WordOfTheDayErrorState extends WordOfTheDayState {
  WordOfTheDayErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
