import 'package:bookly_app/features/home/presentation/view_model/similar_books_controller.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_body_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetailsView extends StatelessWidget {
  BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsBodyView(
          book: Get.arguments,
        ),
      ),
    );
  }
}
