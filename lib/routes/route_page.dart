import 'package:flutter/material.dart';
import 'package:submission_restaurant/screen/detail_page.dart';
import 'package:submission_restaurant/screen/home_page.dart';
import 'package:submission_restaurant/data/models/restaurant_model.dart';
import 'package:submission_restaurant/screen/splash_page.dart';


Map<String, Widget Function(BuildContext)> pageRouteList = {
  HomePage.routeName: (context) => const HomePage(),
  DetailPage.routeName: (context) => DetailPage(
        restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
      ),
  SplashPage.routeName: (context) => const SplashPage(),
};
