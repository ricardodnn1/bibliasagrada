part of 'selected_chapter_cubit.dart';

sealed class SelectedChapterState extends Equatable {}

final class SelectedChapterInitialState extends SelectedChapterState {
  @override
  List<Object?> get props => [];
}

final class SelectedChapterChangeState extends SelectedChapterState {
  SelectedChapterChangeState({
    required this.selectedChapter,
  });

  final int selectedChapter;

  @override
  List<Object?> get props => [selectedChapter];
}
