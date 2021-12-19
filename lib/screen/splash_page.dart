import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:submission_restaurant/screen/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const HomePage(),
      duration: 2000,
      imageSize: 200,
      imageSrc: 'assets/images/logo/logo-white.png',
      text: 'Restaurant App',
      textStyle: Theme.of(context).textTheme.headline6,
      backgroundColor: Colors.white,
      pageRouteTransition: PageRouteTransition.SlideTransition,
      speed: 500,
    );
  }
}
