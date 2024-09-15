import 'package:bibliasagrada/src/features/presenter/word_of_the_day/cubits/word_of_the_day_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WordOfTheDayPage extends StatefulWidget {
  const WordOfTheDayPage({super.key});

  @override
  State<WordOfTheDayPage> createState() => _WordOfTheDayPageState();
}

class _WordOfTheDayPageState extends State<WordOfTheDayPage> {
  late final WordOfTheDayCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<WordOfTheDayCubit>()..getWordOfTheDay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Palavra do dia',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Semantics(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<WordOfTheDayCubit, WordOfTheDayState>(
            bloc: cubit,
            builder: (context, state) {
              return switch (state) {
                WordOfTheDayInitialState() => const SizedBox(),
                WordOfTheDayLoadingState() => const CircularProgressIndicator(),
                WordOfTheDayErrorState() => Text(state.message),
                WordOfTheDayLoadedState() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.wordOfTheDayEntity.bookName} - ${state.wordOfTheDayEntity.chapter} : ${state.wordOfTheDayEntity.numberOfVerses}',
                        softWrap: true,
                        style: GoogleFonts.montserrat(
                          height: 1.2,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${state.wordOfTheDayEntity.verse.substring(0, 2)} -${state.wordOfTheDayEntity.verse.substring(2)}',
                        softWrap: true,
                        style: GoogleFonts.montserrat(
                          height: 1.2,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
              };
            },
          ),
        ),
      ),
    );
  }
}
