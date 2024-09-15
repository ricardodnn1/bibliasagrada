
import 'package:bibliasagrada/src/features/domain/entities/book_entity.dart';
import 'package:bibliasagrada/src/features/domain/entities/list_books_entity.dart';
import 'package:bibliasagrada/src/features/domain/usecases/list_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_books_state.dart';

class ListBooksCubit extends Cubit<ListBooksState> {
  final ListBooksUsecase listBooksUsecase;

  ListBooksCubit({required this.listBooksUsecase})
      : super(ListBooksInitialState());

  Future<void> getListBooks() async {
    emit(ListBooksLoadingState());

    final usecase = await listBooksUsecase();
    usecase.fold(
        (l) => emit(
              ListBooksErrorState(message: l.message!),
            ), (r) {
      emit(
        ListBooksLoadedState(listBooksEntity: r),
      );
      selectedBook(bookEntity: r.books[0]);
    });
  }

  selectedBook({
    required BookEntity bookEntity,
  }) {
    final stateSelected = (state as ListBooksLoadedState);
    emit(stateSelected.copyWith(
      bookEntity: bookEntity,
      listBooksEntity: stateSelected.listBooksEntity,
    ));
  }
}
