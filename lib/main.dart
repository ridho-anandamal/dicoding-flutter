import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/theme_data.dart';
import 'package:submission_restaurant/routes/route_page.dart';
import 'package:submission_restaurant/screen/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(context),
      initialRoute: SplashPage.routeName,
      routes: pageRouteList,
    );
  }
}
