import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NewestBooksLoadingWidget extends StatelessWidget {
  const NewestBooksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.6 / 4,
                child: Image.asset(
                  Assets.loading,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                'Loading',
                style: Styles.textStyle20.copyWith(
                  fontFamily: kGTSectraFine,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
