import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:get/get.dart';

class SearchBooksController extends GetxController {
  SearchBooksController(this.homeRepo);
  final HomeRepo homeRepo;
  List<BookModel>? booksList;
  Failure? failureMsg;
  Rx<bool> isLoading = false.obs;

  Future<void> fetchSearchBooks({
    required String keyword,
  }) async {
        isLoading.value = true;
    // emit(SearchBooksLoading());
    var result = await homeRepo.fetchSearchBooks(
      keyword: keyword,
    );
    result.fold((failure) {
      isLoading.value = false;
      failureMsg = failure;
      // emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
      isLoading.value = false;
      booksList = books;
      // emit(SearchBooksSuccess(books));
    });
  }
}
