import 'package:bibliasagrada/shared/widgets/custom_dropdown_button_widget.dart';
import 'package:bibliasagrada/src/features/domain/entities/book_entity.dart';
import 'package:bibliasagrada/src/features/domain/entities/title_entity.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/list_books/list_books_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/list_verses/list_verses_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/selected_chapter/selected_chapter_cubit.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/title/title_cubit.dart';
import 'package:bibliasagrada/shared/widgets/slidable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BiblePage extends StatefulWidget {
  const BiblePage({
    super.key,
  });

  @override
  State<BiblePage> createState() => _BiblePageState();
}

class _BiblePageState extends State<BiblePage> {
  late final ListBooksCubit listBooksCubit;
  late final SelectedChapterCubit selectedChapterCubit;
  late final ListVersesCubit listVersesCubit;
  late final TitleCubit titleCubit;

  int? bookId = 1;
  String? bookName;

  @override
  void initState() {
    super.initState();
    listBooksCubit = context.read<ListBooksCubit>()..getListBooks();
    selectedChapterCubit = context.read<SelectedChapterCubit>()
      ..selectedChapter(changed: 1);
    listVersesCubit = context.read<ListVersesCubit>()
      ..getListVerses(
        bookId: 1,
        chapterId: 1,
      );
    bookName = 'Gênesis';
    titleCubit = context.read<TitleCubit>()..getAllTitle();
  }

  @override
  void dispose() {
    super.dispose();
    listBooksCubit.close();
    selectedChapterCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bíblia Sagrada!',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Semantics(
        child: Column(
          children: [
            BlocBuilder<ListBooksCubit, ListBooksState>(
              bloc: listBooksCubit,
              builder: (_, state) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (state is ListBooksLoadedState) ...[
                          CustomDropdownButtonWidget<BookEntity>(
                            item: state.bookEntity ??
                                state.listBooksEntity!.books[0],
                            listItems: state.listBooksEntity!.books
                                .map(
                                  (book) => DropdownMenuItem<BookEntity>(
                                    value: book,
                                    child: Text(
                                      book.name,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              listBooksCubit.selectedBook(bookEntity: value!);
                              selectedChapterCubit.selectedChapter(
                                changed: 1,
                              );
                              listVersesCubit.getListVerses(
                                bookId: value.bookId,
                                chapterId: 1,
                              );
                              bookId = value.bookId;
                              bookName = value.name;
                            },
                          ),
                          BlocBuilder<SelectedChapterCubit,
                              SelectedChapterState>(
                            bloc: selectedChapterCubit,
                            builder: (context, selectedState) {
                              return CustomDropdownButtonWidget<int>(
                                item: (selectedState
                                        as SelectedChapterChangeState)
                                    .selectedChapter,
                                listItems: List.generate(
                                  state.bookEntity!.numberOfChapter,
                                  (index) => DropdownMenuItem<int>(
                                    value: index + 1,
                                    child: Text((index + 1).toString()),
                                  ),
                                ).toList(),
                                onChanged: (value) {
                                  selectedChapterCubit.selectedChapter(
                                    changed: value!,
                                  );

                                  listVersesCubit.getListVerses(
                                    bookId: bookId!,
                                    chapterId: value,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
            BlocConsumer<ListVersesCubit, ListVersesState>(
              bloc: listVersesCubit,
              listener: (context, stateVerses) {},
              builder: (context, stateVerses) {
                return switch (stateVerses) {
                  ListVersesInitialState() => Container(
                      color: Colors.red,
                    ),
                  ListVersesLoadingState() => const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5.0,
                        ),
                      ),
                    ),
                  ListVersesLoadedState() => Expanded(
                      child: ListView.builder(
                        itemCount:
                            stateVerses.listVersesEntity.listVerses.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final listVerseEntity =
                              stateVerses.listVersesEntity.listVerses[index];

                          return BlocBuilder<TitleCubit, TitleState>(
                            bloc: titleCubit,
                            buildWhen: (previous, current) =>
                                current is TitleLoadedState,
                            builder: (context, stateTitle) {
                              return switch (stateTitle) {
                                TitleInitialState() => const SizedBox(),
                                TitleLoadingState() =>
                                  const CircularProgressIndicator(),
                                TitleLoadedState() => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FutureBuilder<List<TitleEntity>>(
                                        initialData: const [],
                                        future: titleCubit.getTitle(
                                          bookId: listVerseEntity.bookId,
                                          chapterId: listVerseEntity.chapterId,
                                          numberVerse:
                                              listVerseEntity.verseNumber,
                                        ),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<TitleEntity>>
                                                snapshot) {
                                          if (snapshot.data != []) {
                                            List<TitleEntity> title =
                                                snapshot.data!.toList();
                                            return ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: title.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 26,
                                                    vertical: 8,
                                                  ),
                                                  child: Text(
                                                    title[index].textTitle,
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 18,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            return const SizedBox();
                                          }
                                        },
                                      ),
                                      SlidableWidget(
                                        verseEntity: listVerseEntity,
                                        bookName: bookName!,
                                      ),
                                    ],
                                  ),
                                TitleErrorState() => const SizedBox(),
                              };
                            },
                          );
                        },
                      ),
                    ),
                  ListVersesErrorState() => Container(
                      color: Colors.black,
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
