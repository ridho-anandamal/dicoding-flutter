import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  late final Future<SharedPreferences> sharedPreferences;
  
  PreferencesHelper({required this.sharedPreferences});

  static const darkTheme = 'dark_theme';

  Future<bool> get isDarkTheme async{
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  static const dailyNotification = 'daily_notification';

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotification) ?? false;
  }

  void setDailyNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotification, value);
  }
}