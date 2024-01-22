import 'package:bookly_app/core/utils/functions/custom_snakbar.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentation/view_model/similar_books_controller.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:get/get.dart';

void goToDetailsView(context,BookModel book) async {
  if (await ConnectivityWrapper.instance.isConnected) {
    Get.to(()=>
      BookDetailsView(),
      arguments: book,
      binding: BindingsBuilder.put(
        () => SimilarBooksController(
          getIt.get<HomeRepoImpl>(),
          book.volumeInfo.categories!.first,
        ),
      ),
    );
  } else {
    customSnackBar(context, "You Are Not Connected");
  }
}
