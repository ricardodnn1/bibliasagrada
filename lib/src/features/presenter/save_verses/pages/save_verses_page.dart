import 'package:bibliasagrada/shared/cubits/update_marked_verse/update_marked_verse_cubit.dart';
import 'package:bibliasagrada/shared/helper/share_helper.dart';
import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:bibliasagrada/src/features/presenter/save_verses/cubits/list_marked_verses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class SaveVersesPage extends StatefulWidget {
  const SaveVersesPage({super.key});

  @override
  State<SaveVersesPage> createState() => _SaveVersesPageState();
}

class _SaveVersesPageState extends State<SaveVersesPage>
    with SingleTickerProviderStateMixin {
  late final ListMarkedVersesCubit cubit;
  late final controller = SlidableController(this);
  late final UpdateMarkedVerseCubit _updateMarkedVerseCubit;

  @override
  void initState() {
    super.initState();
    _updateMarkedVerseCubit = context.read<UpdateMarkedVerseCubit>();
    cubit = context.read<ListMarkedVersesCubit>()..getListMarkedVerses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Versículos Marcados',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Semantics(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ListMarkedVersesCubit, ListMarkedVersesState>(
              bloc: cubit,
              builder: (context, state) {
                return switch (state) {
                  ListMarkedVersesInitialState() => const SizedBox.shrink(),
                  ListMarkedVersesLoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ListMarkedVersesEmptyState() => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: SizedBox(
                        child: Text(
                          'Você ainda não marcou nenhum versículo!',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            height: 1.2,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ListMarkedVersesLoadedState() => ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.listMarkedVerseEntity.listVerses.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                      itemBuilder: (context, index) {
                        final list = state.listMarkedVerseEntity.listVerses;
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                padding: const EdgeInsets.all(0),
                                onPressed: (_) {
                                  controller.openEndActionPane();
                                  shareText(
                                    book: list[index].bookName!,
                                    verse: list[index].verse,
                                  );
                                },
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.black,
                                icon: Icons.share,
                              ),
                              SlidableAction(
                                padding: const EdgeInsets.all(0),
                                onPressed: (_) {
                                  _updateMarkedVerseCubit.updateMarkedVerse(
                                    verseEntity: VerseEntity(
                                      id: list[index].id,
                                      bookId: list[index].bookId,
                                      chapterId: list[index].chapterId,
                                      verseNumber: list[index].verseNumber,
                                      verse: list[index].verse,
                                      markedVerse: 0,
                                      colorId: 0,
                                    ),
                                  );
                                  cubit.updateListMarkedVerses();
                                  controller.close();
                                },
                                backgroundColor: Colors.amberAccent,
                                foregroundColor: Colors.black,
                                icon: Icons.done_outline_sharp,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list[index].bookName} - ${list[index].chapterId} : ${list[index].verseNumber}',
                                softWrap: true,
                                style: GoogleFonts.montserrat(
                                  height: 1.2,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '${list[index].verse.substring(0, 2)}- ${list[index].verse.substring(2)}',
                                softWrap: true,
                                style: GoogleFonts.montserrat(
                                  height: 1.2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  ListMarkedVersesErrorState() => throw UnimplementedError(),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}
