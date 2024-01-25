import 'package:bookly_app/core/utils/functions/lunch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              text: getText(book),
              fontSize: 16,
              backgroundColor: const Color(0xffef8262),
              textColor: Colors.white,
              isLeftBorderRadius: false,
              onPressed: () async {
                launchUrlFunction(
                  context,
                  book.volumeInfo.previewLink,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Free Preview';
    }
  }
}
