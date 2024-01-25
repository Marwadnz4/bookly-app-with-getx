import 'package:bookly_app/core/widgets/offline_widget.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_section.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:flutter/material.dart';

class BookDetailsBodyView extends StatelessWidget {
   BookDetailsBodyView({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      disableInteraction: true,
      offlineWidget: const OfflineWidget(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  BookDetailsSection(
                    book: book,
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  const SimilarBooksSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
