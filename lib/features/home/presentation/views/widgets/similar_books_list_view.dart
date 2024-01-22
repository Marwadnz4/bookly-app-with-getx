import 'package:bookly_app/core/utils/functions/goto_details_view.dart';
import 'package:bookly_app/core/widgets/custom_Loading_widget.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/similar_books_controller.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimilarBooksListView extends StatelessWidget {
  SimilarBooksListView({super.key});
  final SimilarBooksController similarBooksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (similarBooksController.booksList != null && similarBooksController.isLoading.value == false) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: similarBooksController.booksList!.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: GestureDetector(
                onTap: () => goToDetailsView(context, similarBooksController.booksList![index]),
                child: CustomBookImage(
                  imageUrl: similarBooksController.booksList![index].volumeInfo.imageLinks?.thumbnail,
                ),
              ),
            ),
          ),
        );
      } else if (similarBooksController.failureMsg != null) {
        return CustomErrorWidget(errorMessage: similarBooksController.failureMsg.toString());
      } else if (similarBooksController.isLoading.value) {
        return const CustomLoadingWidget();
      }
      return Container();
    });
  }
}
