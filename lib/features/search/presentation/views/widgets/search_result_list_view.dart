import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_controller.dart';
import 'package:get/get.dart';

class SearchResultListView extends StatelessWidget {
  SearchResultListView({super.key});

  final SearchBooksController searchBooksController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchBooksController.booksList != null && searchBooksController.isLoading.value == false) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: searchBooksController.booksList!.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: BookListViewItem(
              book: searchBooksController.booksList![index],
            ),
          ),
        );
      } else if (searchBooksController.failureMsg != null) {
        return CustomErrorWidget(errorMessage: searchBooksController.failureMsg.toString());
      } else if (searchBooksController.isLoading.value) {
        return const NewestBooksLoadingWidget();
      }
      return Container();
    });
  }
}
