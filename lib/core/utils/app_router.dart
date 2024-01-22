import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

const String kHomeView = '/homeView';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const SplashView(),
  kHomeView: (context) => const HomeView(),
};
