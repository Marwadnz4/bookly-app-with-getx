import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_controller.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  @override

  void dependencies() {
  Get.put(FeaturedBooksController(
      getIt.get<HomeRepoImpl>(),
    ));
    Get.put(NewestBooksController(
      getIt.get<HomeRepoImpl>(),
    ));
  }
}