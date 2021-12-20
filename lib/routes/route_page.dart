import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/screen/detail_page.dart';
import 'package:submission_restaurant/screen/home_page.dart';
import 'package:submission_restaurant/screen/review_restaurant_page.dart';
import 'package:submission_restaurant/screen/splash_page.dart';

Map<String, Widget Function(BuildContext)> pageRouteList = {
  SplashPage.routeName: (context) => const SplashPage(),
  HomePage.routeName: (context) => const HomePage(),
  DetailPage.routeName: (context) => DetailPage(
        idRestaurant: ModalRoute.of(context)?.settings.arguments as String,
      ),
  ReviewRestaurantPage.routeName: (context) => ReviewRestaurantPage(
        restaurant:
            ModalRoute.of(context)?.settings.arguments as RestaurantDataDetail,
      ),
};
