import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books_controller.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewestBooksListView extends StatelessWidget {
  NewestBooksListView({super.key});
  final NewestBooksController newestBooksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (newestBooksController.booksList != null && newestBooksController.isLoading.value == false) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: newestBooksController.booksList!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: BookListViewItem(
              book: newestBooksController.booksList![index],
            ),
          ),
        );
      } else if (newestBooksController.failureMsg != null) {
        return CustomErrorWidget(errorMessage: newestBooksController.failureMsg.toString());
      } else if (newestBooksController.isLoading.value) {
        return const NewestBooksLoadingWidget();
      }
      return Container();
    });
  }
}
