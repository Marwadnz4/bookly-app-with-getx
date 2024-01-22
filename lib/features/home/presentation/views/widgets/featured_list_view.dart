import 'package:bookly_app/core/utils/functions/goto_details_view.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_controller.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedBooksListView extends StatelessWidget {
  FeaturedBooksListView({super.key});
  final FeaturedBooksController featuredBooksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (featuredBooksController.booksList != null && featuredBooksController.isLoading.value == false) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: featuredBooksController.booksList!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () async {
                  goToDetailsView(context, featuredBooksController.booksList![index]);
                },
                child: CustomBookImage(
                  imageUrl: featuredBooksController.booksList![index].volumeInfo.imageLinks?.thumbnail,
                ),
              ),
            ),
          ),
        );
      } else if (featuredBooksController.failureMsg != null) {
        return CustomErrorWidget(errorMessage: featuredBooksController.failureMsg.toString());
      } else if (featuredBooksController.isLoading.value) {
        return const FeaturedBooksLoadingWidget();
      }
      return Container();
    });
  }
}
