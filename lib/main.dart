import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/bindings.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_checker/connectivity_checker.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return ConnectivityAppWrapper(
            app: GetMaterialApp(
               initialBinding: AppBinding(),
              routes: appRoutes,
              title: 'Bookly App',
              
              showSemanticsDebugger: false,
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: kPrimaryColor,
                textTheme: GoogleFonts.montserratTextTheme(
                  ThemeData.dark().textTheme,
                ),
              ),
            ),
          );
        },
      
    );
  }
}
