import 'package:bibliasagrada/shared/database/database_helper.dart';
import 'package:bibliasagrada/src/features/data/repositories/list_books_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/list_marked_verse_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/list_theme_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/list_theme_verses_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/list_verses_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/list_title_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/update_marked_verse_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/repositories/word_of_the_day_repository_impl.dart';
import 'package:bibliasagrada/src/features/data/services/list_books_service.dart';
import 'package:bibliasagrada/src/features/data/services/list_books_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/list_marked_verses_service.dart';
import 'package:bibliasagrada/src/features/data/services/list_marked_verses_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_service.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_verses_service.dart';
import 'package:bibliasagrada/src/features/data/services/list_theme_verses_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/list_verses_service.dart';
import 'package:bibliasagrada/src/features/data/services/list_verses_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/list_title_service.dart';
import 'package:bibliasagrada/src/features/data/services/list_title_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/update_marked_verse_service.dart';
import 'package:bibliasagrada/src/features/data/services/update_marked_verse_service_impl.dart';
import 'package:bibliasagrada/src/features/data/services/word_of_the_day_service.dart';
import 'package:bibliasagrada/src/features/data/services/word_of_the_day_service_impl.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_books_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_marked_verses_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_theme_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_theme_verses_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_verses_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/list_title_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/update_marked_verse_repository.dart';
import 'package:bibliasagrada/src/features/domain/repositories/word_of_the_day_repository.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_books_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_books_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_marked_verses_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_marked_verses_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_verses_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_theme_verses_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_verses_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_verses_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_title_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_title_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/update_marked_verse_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/update_marked_verse_usecase_impl.dart';
import 'package:bibliasagrada/src/features/domain/usecases/word_of_the_day_usecase.dart';
import 'package:bibliasagrada/src/features/domain/usecases/word_of_the_day_usecase_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton(() => DatabaseHelper());

  //TODO: List books
  getIt.registerFactory<ListBooksRepository>(
    () => ListBooksRepositoryImpl(
      listBooksService: getIt.get<ListBooksService>(),
    ),
  );

  getIt.registerFactory<ListBooksUsecase>(
    () => ListBooksUsecaseImpl(
      listBooksRepository: getIt.get<ListBooksRepository>(),
    ),
  );

  getIt.registerFactory<ListBooksService>(
    () => ListBooksServiceImpl(),
  );

  //TODO: List verses
  getIt.registerFactory<ListVersesRepository>(
    () => ListVersesRepositoryImpl(
      listVersesService: getIt.get<ListVersesService>(),
    ),
  );

  getIt.registerFactory<ListVersesUsecase>(
    () => ListVersesUsecaseImpl(
      listVersesRepository: getIt.get<ListVersesRepository>(),
    ),
  );

  getIt.registerFactory<ListVersesService>(
    () => ListVersesServiceImpl(),
  );

  //TODO: List titles
  getIt.registerFactory<ListTitleRepository>(
    () => ListTitleRepositoryImpl(
      titleService: getIt.get<ListTitleService>(),
    ),
  );

  getIt.registerFactory<ListTitleUsecase>(
    () => ListTitleUsecaseImpl(
      titleRepository: getIt.get<ListTitleRepository>(),
    ),
  );

  getIt.registerFactory<ListTitleService>(
    () => ListTitleServiceImpl(),
  );

  //TODO: Update marked verse
  getIt.registerFactory<UpdateMarkedVerseService>(
    () => UpdateMarkedVerseServiceImpl(),
  );

  getIt.registerFactory<UpdateMarkedVerseRepository>(
    () => UpdateMarkedVerseRepositoryImpl(
      updateMarkedVerseService: getIt.get<UpdateMarkedVerseService>(),
    ),
  );

  getIt.registerFactory<UpdateMarkedVerseUsecase>(
    () => UpdateMarkedVerseUsecaseImpl(
      updateMarkedVerseRepository: getIt.get<UpdateMarkedVerseRepository>(),
    ),
  );

  //TODO: Marked Verses List
  getIt.registerFactory<ListMarkedVersesService>(
    () => ListMarkedVersesServiceImpl(),
  );

  getIt.registerFactory<ListMarkedVersesRepository>(
    () => ListMarkedVersesRepositoryImpl(
      listMarkedVersesService: getIt.get<ListMarkedVersesService>(),
    ),
  );

  getIt.registerFactory<ListMarkedVersesUsecase>(
    () => ListMarkedVersesUsecaseImpl(
      listMarkedVersesRepository: getIt.get<ListMarkedVersesRepository>(),
    ),
  );

  //TODO: Word of the day
  getIt.registerFactory<WordOfTheDayService>(
    () => WordOfTheDayServiceImpl(),
  );

  getIt.registerFactory<WordOfTheDayRepository>(
    () => WordOfTheDayRepositoryImpl(
      wordOfTheDayService: getIt.get<WordOfTheDayService>(),
    ),
  );

  getIt.registerFactory<WordOfTheDayUsecase>(
    () => WordOfTheDayUsecaseImpl(
      wordOfTheDayRepository: getIt.get<WordOfTheDayRepository>(),
    ),
  );

  //TODO: Themes
  getIt.registerFactory<ListThemeService>(
    () => ListThemeServiceImpl(),
  );

  getIt.registerFactory<ListThemeRepository>(
    () => ListThemeRepositoryImpl(
      listThemeService: getIt.get<ListThemeService>(),
    ),
  );

  getIt.registerFactory<ListThemeUsecase>(
    () => ListThemeUsecaseImpl(
      listThemeRepository: getIt.get<ListThemeRepository>(),
    ),
  );

  //TODO: Theme Verses
  getIt.registerFactory<ListThemeVersesService>(
    () => ListThemeVersesServiceImpl(),
  );

  getIt.registerFactory<ListThemeVersesRepository>(
    () => ListThemeVersesRepositoryImpl(
      listThemeVersesService: getIt.get<ListThemeVersesService>(),
    ),
  );

  getIt.registerFactory<ListThemeVersesUsecase>(
    () => ListThemeVersesUsecaseImpl(
      listThemeVersesRepository: getIt.get<ListThemeVersesRepository>(),
    ),
  );
}
