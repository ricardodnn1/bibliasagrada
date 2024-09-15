import 'package:bibliasagrada/src/features/domain/entities/word_of_the_day_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/word_of_the_day_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'word_of_the_day_state.dart';

class WordOfTheDayCubit extends Cubit<WordOfTheDayState> {
  WordOfTheDayCubit({
    required this.wordOfTheDayUsecase,
  }) : super(WordOfTheDayInitialState());

  final WordOfTheDayUsecase wordOfTheDayUsecase;

  Future<void> getWordOfTheDay() async {
    emit(WordOfTheDayLoadingState());

    final usecase = await wordOfTheDayUsecase();

    usecase.fold(
      (l) => emit(WordOfTheDayErrorState(message: l.message!)),
      (r) => emit(
        WordOfTheDayLoadedState(wordOfTheDayEntity: r),
      ),
    );
  }
}
