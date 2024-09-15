import 'package:bibliasagrada/shared/helper/share_helper.dart';
import 'package:bibliasagrada/src/features/domain/entities/verse_entity.dart';
import 'package:bibliasagrada/src/features/presenter/bible/pages/cubits/list_verses/list_verses_cubit.dart';
import 'package:bibliasagrada/shared/cubits/update_marked_verse/update_marked_verse_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class SlidableWidget extends StatefulWidget {
  const SlidableWidget({
    super.key,
    required this.verseEntity,
    this.bookName,
  });

  final VerseEntity verseEntity;
  final String? bookName;

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  late final UpdateMarkedVerseCubit _updateMarkedVerseCubit;
  late final ListVersesCubit _listVersesCubit;

  @override
  void initState() {
    super.initState();
    _updateMarkedVerseCubit = context.read<UpdateMarkedVerseCubit>();
    _listVersesCubit = context.read<ListVersesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.verseEntity.marked
            ? _getColorSelect(widget.verseEntity.colorId)
            : Colors.transparent,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              padding: const EdgeInsets.all(0),
              onPressed: (_) {
                controller.openEndActionPane();
                shareText(
                  book: widget.bookName!,
                  verse: widget.verseEntity.verse,
                );
              },
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              icon: Icons.share,
            ),
            widget.verseEntity.marked
                ? SlidableAction(
                    padding: const EdgeInsets.all(0),
                    onPressed: (_) {
                      _updateMarkedVerseCubit.updateMarkedVerse(
                        verseEntity: VerseEntity(
                          id: widget.verseEntity.id,
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                          verseNumber: widget.verseEntity.verseNumber,
                          verse: widget.verseEntity.verse,
                          markedVerse: 0,
                          colorId: 0,
                        ),
                      );
                      _listVersesCubit.updateListVerses(
                        bookId: widget.verseEntity.bookId,
                        chapterId: widget.verseEntity.chapterId,
                      );
                      controller.close();
                    },
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    icon: Icons.done_outline_sharp,
                  )
                : SlidableAction(
                    padding: const EdgeInsets.all(0),
                    onPressed: (_) {
                      selectedColor(context, widget.verseEntity);
                      controller.close();
                    },
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    icon: Icons.done,
                  ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.verseEntity.fullVerse,
            softWrap: true,
            style: GoogleFonts.openSans(
              height: 1.2,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectedColor(BuildContext context, VerseEntity verseEntity) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          title: Text(
            'SELECIONE UMA COR',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 1,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFffd740),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 2,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFffff00),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 3,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFaeea00),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 4,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF64dd17),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 5,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFb2ff59),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 6,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFffab40),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 7,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFfb8c00),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 8,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFff6d00),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 9,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFff7043),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 10,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF8d6e63),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 11,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFbdbdbd),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateMarkedVerseCubit.updateMarkedVerse(
                          verseEntity: VerseEntity(
                            id: widget.verseEntity.id,
                            bookId: widget.verseEntity.bookId,
                            chapterId: widget.verseEntity.chapterId,
                            verseNumber: widget.verseEntity.verseNumber,
                            verse: widget.verseEntity.verse,
                            markedVerse: 1,
                            colorId: 12,
                          ),
                        );
                        _listVersesCubit.updateListVerses(
                          bookId: widget.verseEntity.bookId,
                          chapterId: widget.verseEntity.chapterId,
                        );
                        Navigator.pop(context);
                      },
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF78909c),
                        ),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getColorSelect(int colorId) {
    const colorMap = {
      1: Color(0xffffd740),
      2: Color(0xffffff00),
      3: Color(0xffaeea00),
      4: Color(0xff64dd17),
      5: Color(0xffb2ff59),
      6: Color(0xffffab40),
      7: Color(0xfffb8c00),
      8: Color(0xffff6d00),
      9: Color(0xffff7043),
      10: Color(0xff8d6e63),
      11: Color(0xffbdbdbd),
      12: Color(0xff78909c),
    };

    return colorMap[colorId] ?? Colors.transparent;
  }
}
