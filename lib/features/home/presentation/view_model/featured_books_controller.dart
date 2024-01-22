import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:get/get.dart';

class FeaturedBooksController extends GetxController {
  FeaturedBooksController(this.homeRepo);
  final HomeRepo homeRepo;
  List<BookModel>? booksList;
  Failure? failureMsg;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedBooks();
  }

  Future<void> fetchFeaturedBooks() async {
    isLoading.value = true;

    // emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      isLoading.value = false;
      failureMsg = failure;
      // emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      isLoading.value = false;
      booksList = books;
      // emit(FeaturedBooksSuccess(books));
    });
  }
}
