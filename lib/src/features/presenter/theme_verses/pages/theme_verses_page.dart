import 'dart:developer';

import 'package:bibliasagrada/shared/cubits/update_marked_verse/update_marked_verse_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/theme_verses/cubit/theme_verses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeVersesPage extends StatefulWidget {
  const ThemeVersesPage({
    super.key,
    required this.themeId,
  });

  final int themeId;

  @override
  State<ThemeVersesPage> createState() => _ThemeVersesPageState();
}

class _ThemeVersesPageState extends State<ThemeVersesPage> {
  late final ThemeVersesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ThemeVersesCubit>()..getVerses(theme: widget.themeId);
  }

  @override
  Widget build(BuildContext context) {
    log(widget.themeId.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temas Bíblicos',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Semantics(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ThemeVersesCubit, ThemeVersesState>(
            bloc: cubit,
            builder: (context, state) {
              return switch (state) {
                ThemeVersesInitialState() => const SizedBox.shrink(),
                ThemeVersesLoadedState() => ListView.separated(
                    itemBuilder: (context, index) {
                      final listThemeVerses =
                          state.listThemeVersesEntity.listThemeVerses[index];
                      return SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listThemeVerses.bodyText,
                              style: GoogleFonts.montserrat(
                                height: 1.2,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              listThemeVerses.numberOfVerse,
                              style: GoogleFonts.montserrat(
                                height: 1.2,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemCount:
                        state.listThemeVersesEntity.listThemeVerses.length,
                  ),
                ThemeVersesErrorState() => const SizedBox.shrink(),
                ThemeVersesLoadingState() => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                      semanticsLabel: 'Carregando...',
                      strokeWidth: 5,
                      backgroundColor: Colors.black,
                    ),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
