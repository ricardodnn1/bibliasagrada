import 'dart:developer';

import 'package:bibliasagrada/shared/injections/injections.dart';
import 'package:bibliasagrada/shared/routes/routes_named.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_books_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_marked_verses_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_verses_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_title_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_verses_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/update_marked_verse_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/word_of_the_day_usecase.dart';
import 'package:bibliasagrada/src/features/presenter/about/pages/about_page.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/list_books/list_books_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/bible_page.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/list_verses/list_verses_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/selected_chapter/selected_chapter_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/title/title_cubit.dart';
import 'package:bibliasagrada/shared/cubits/update_marked_verse/update_marked_verse_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/theme_verses/cubit/theme_verses_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/theme_verses/pages/theme_verses_page.dart';
import 'package:bibliasagrada/src/features/presenter/themes/pages/themes_page.dart';
import 'package:bibliasagrada/src/features/presenter/home/pages/home_page.dart';
import 'package:bibliasagrada/src/features/presenter/save_verses/cubits/list_marked_verses_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/save_verses/pages/save_verses_page.dart';
import 'package:bibliasagrada/src/features/presenter/themes/pages/cubits/list_theme_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/word_of_the_day/cubits/word_of_the_day_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/word_of_the_day/pages/word_of_the_day_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final routes = {
  RoutesNamed.homePage: (context) => const HomePage(),
  RoutesNamed.biblePage: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<ListBooksCubit>(
            create: (_) => ListBooksCubit(
              listBooksUsecase: getIt.get<ListBooksUsecase>(),
            ),
          ),
          BlocProvider<SelectedChapterCubit>(
            create: (_) => SelectedChapterCubit(),
          ),
          BlocProvider<ListVersesCubit>(
            create: (_) => ListVersesCubit(
              listVersesUsecase: getIt.get<ListVersesUsecase>(),
            ),
          ),
          BlocProvider<TitleCubit>(
            create: (_) => TitleCubit(
              titleUsecase: getIt.get<ListTitleUsecase>(),
            ),
          ),
          BlocProvider<UpdateMarkedVerseCubit>(
            create: (_) => UpdateMarkedVerseCubit(
              updateMarkedVerseUsecase: getIt.get<UpdateMarkedVerseUsecase>(),
            ),
          ),
        ],
        child: const BiblePage(),
      ),
  RoutesNamed.saveVerses: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<ListMarkedVersesCubit>(
            create: (context) => ListMarkedVersesCubit(
              listMarkedVersesUsecase: getIt.get<ListMarkedVersesUsecase>(),
            ),
          ),
          BlocProvider<UpdateMarkedVerseCubit>(
            create: (_) => UpdateMarkedVerseCubit(
              updateMarkedVerseUsecase: getIt.get<UpdateMarkedVerseUsecase>(),
            ),
          ),
        ],
        child: const SaveVersesPage(),
      ),
  RoutesNamed.about: (context) => const AboutPage(),
  RoutesNamed.wordOftheDay: (context) => BlocProvider<WordOfTheDayCubit>(
        create: (context) => WordOfTheDayCubit(
          wordOfTheDayUsecase: getIt.get<WordOfTheDayUsecase>(),
        ),
        child: const WordOfTheDayPage(),
      ),
  RoutesNamed.biblicalThemas: (context) => BlocProvider<ListThemeCubit>(
        create: (context) => ListThemeCubit(
          listThemeUsecase: getIt.get<ListThemeUsecase>(),
        ),
        child: const ThemesPage(),
      ),
  RoutesNamed.themeVerses: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider<ThemeVersesCubit>(
      create: (context) => ThemeVersesCubit(
        listThemeVersesUsecase: getIt.get<ListThemeVersesUsecase>(),
      ),
      child: ThemeVersesPage(themeId: args['themeId']),
    );
  }
};
