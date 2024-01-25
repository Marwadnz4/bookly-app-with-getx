import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/search/data/repos/home_repo_imp.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_books_controller.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.to(
                const SearchView(),
                binding: BindingsBuilder.put(
                  () => SearchBooksController(
                    getIt.get<SearchRepo>(),
                  ),
                ),
              );
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

mixin data {}
