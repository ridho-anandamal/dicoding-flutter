import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/screen/home_page.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencecsSettingsProvider>(
        builder: (context, preferencesSettings, _) {
      return SplashScreenView(
        navigateRoute: const HomePage(),
        duration: 2000,
        imageSize: 200,
        imageSrc: 'assets/images/logo/logo-transparent.png',
        text: 'Restaurant App',
        textStyle: Theme.of(context).textTheme.headline6?.copyWith(
          color: preferencesSettings.isDarkTheme ? whiteColor : blackColor,
        ),
        backgroundColor: preferencesSettings.isDarkTheme ? darkModeBlackColor : whiteColor,
        pageRouteTransition: PageRouteTransition.SlideTransition,
        speed: 500,
      );
    });
  }
}
