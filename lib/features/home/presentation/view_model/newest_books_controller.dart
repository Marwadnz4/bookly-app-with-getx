import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:get/get.dart';

class NewestBooksController extends GetxController {
  NewestBooksController(this.homeRepo);
  final HomeRepo homeRepo;
  List<BookModel>? booksList;
  Failure? failureMsg;
  Rx<bool> isLoading = false.obs;

    @override
  void onInit() {
    super.onInit();
    fetchNewestBooks();
  }

  Future<void> fetchNewestBooks() async {
    isLoading.value = true;
    // emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((failure) {
      isLoading.value = false;
      failureMsg = failure;
      // emit(NewestBooksFailure(failure.errMessage));
    }, (books) {
      isLoading.value = false;
      booksList = books;
      // emit(NewestBooksSuccess(books));
    });
  }
}
