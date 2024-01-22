import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:get/get.dart';

class SimilarBooksController extends GetxController {
  SimilarBooksController(this.homeRepo, this.category);
  final HomeRepo homeRepo;
  final String category;
  List<BookModel>? booksList;
  Failure? failureMsg;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSimilarBooks(category: category);
  }
  Future<void> fetchSimilarBooks({
    required String category,
  }) async {
    isLoading.value = true;
    // emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(
      category: category,
    );
    result.fold((failure) {
      isLoading.value = false;
      failureMsg = failure;
      // emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      isLoading.value = false;
      booksList = books;
      // emit(SimilarBooksSuccess(books));
    });
  }
}
