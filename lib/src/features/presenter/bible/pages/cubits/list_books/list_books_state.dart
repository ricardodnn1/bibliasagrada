part of 'list_books_cubit.dart';

sealed class ListBooksState extends Equatable {}

final class ListBooksInitialState extends ListBooksState {
  @override
  List<Object?> get props => [];
}

final class ListBooksLoadingState extends ListBooksState {
  @override
  List<Object?> get props => [];
}

final class ListBooksLoadedState extends ListBooksState {
  ListBooksLoadedState({
    this.bookEntity,
    this.listBooksEntity,
    this.selectedChapter = 1,
  });

  final ListBooksEntity? listBooksEntity;
  final BookEntity? bookEntity;
  final int? selectedChapter;

  ListBooksLoadedState copyWith({
    ListBooksEntity? listBooksEntity,
    BookEntity? bookEntity,
    int? selectedChapter,
  }) {
    return ListBooksLoadedState(
      bookEntity: bookEntity ?? this.bookEntity,
      listBooksEntity: listBooksEntity ?? this.listBooksEntity,
      selectedChapter: selectedChapter ?? this.selectedChapter,
    );
  }

  @override
  List<Object?> get props => [listBooksEntity, bookEntity, selectedChapter];
}

final class ListBooksErrorState extends ListBooksState {
  ListBooksErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
