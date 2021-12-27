import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission_restaurant/data/database/database_favorite.dart';
import 'package:submission_restaurant/data/preference/preferences_settings.dart';
import 'package:submission_restaurant/routes/route_page.dart';
import 'package:submission_restaurant/screen/splash_page.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantFavoriteDatabaseProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencecsSettingsProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        )
      ],
      child: Consumer<PreferencecsSettingsProvider>(
        builder: (context, preferencesSetting, child) {
          return MaterialApp(
            title: 'Restaurant App',
            theme: preferencesSetting.themeData,
            initialRoute: SplashPage.routeName,
            routes: pageRouteList,
            builder: (context, child) {
              return CupertinoTheme(
                data: CupertinoThemeData(
                    brightness: preferencesSetting.isDarkTheme
                        ? Brightness.dark
                        : Brightness.light),
                child: Material(
                  child: child,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
