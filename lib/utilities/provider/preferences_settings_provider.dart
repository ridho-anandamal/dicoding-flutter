import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/theme_data.dart';
import 'package:submission_restaurant/data/preference/preferences_settings.dart';

class PreferencecsSettingsProvider extends ChangeNotifier{
  late PreferencesHelper preferencesHelper;

  PreferencecsSettingsProvider({required this.preferencesHelper}){
    _getTheme();
    _getDailyNotificationPrefences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;
  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  bool _isDailyNotificationActive = false;
  bool get isDailyNotificationActive => _isDailyNotificationActive;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyNotificationPrefences() async {
    _isDailyNotificationActive = await preferencesHelper.isDailyNotificationActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value){
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyNotification(bool value) {
    preferencesHelper.setDailyNotification(value);
    _getDailyNotificationPrefences();
  }
}