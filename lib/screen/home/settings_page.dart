import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/utilities/helper/notification_helper.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';
import 'package:submission_restaurant/utilities/provider/scheduling_notification_provider.dart';

import '../../main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String pageName = 'Pengaturan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
      ),
      body: Consumer<PreferencecsSettingsProvider>(
        builder: (context, preferencesSettings, child) {
          return ListView(
            children: [
              Material(
                child: ListTile(
                  title: const Text('Dark Theme'),
                  trailing: Switch.adaptive(
                    value: preferencesSettings.isDarkTheme,
                    onChanged: (value) {
                      preferencesSettings.enableDarkTheme(value);
                    },
                  ),
                ),
              ),
              Material(
                child: Consumer<SchedulingProvider>(
                  builder: (context, schedulerNotification, _) {
                    return ListTile(
                      title: const Text('Active Notification'),
                      trailing: Switch.adaptive(
                        value: preferencesSettings.isDailyNotificationActive,
                        onChanged: (value) {
                          schedulerNotification.scheduledNews(value);
                          preferencesSettings.enableDailyNotification(value);
                        },
                      ),
                    );
                  },
                ),
              ),
              Material(
                child: ListTile(
                  title: const Text('Test Notification'),
                  trailing: TextButton(
                    child: Text(
                      'Try Notification',
                      style: TextStyle(
                          color: preferencesSettings.isDarkTheme
                              ? Colors.white
                              : Colors.black),
                    ),
                    onPressed: () {
                      NotificationHelper _notificationHelper = NotificationHelper();
                      _notificationHelper.tryNotification(flutterLocalNotificationsPlugin, 'Hello There!', 'This is example notification');
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
