import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission_restaurant/data/common/navigation.dart';
import 'package:submission_restaurant/data/database/database_favorite.dart';
import 'package:submission_restaurant/data/preference/preferences_settings.dart';
import 'package:submission_restaurant/routes/route_page.dart';
import 'package:submission_restaurant/screen/detail_page.dart';
import 'package:submission_restaurant/screen/home/settings_page.dart';
import 'package:submission_restaurant/screen/splash_page.dart';
import 'package:submission_restaurant/utilities/helper/background_services.dart';
import 'package:submission_restaurant/utilities/helper/notification_helper.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_favorite_provider.dart';
import 'package:submission_restaurant/utilities/provider/scheduling_notification_provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();
  _service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationHelper _notificationHelper = NotificationHelper();
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
        ),
        ChangeNotifierProvider(
          create: (_) => SchedulingProvider(),
          child: const SettingsPage(),
        )
      ],
      child: Consumer<PreferencecsSettingsProvider>(
        builder: (context, preferencesSetting, child) {
          return MaterialApp(
            title: 'Restaurant App',
            theme: preferencesSetting.themeData,
            navigatorKey: navigatorKey,
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

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(DetailPage.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
