import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';

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
                child: ListTile(
                  title: const Text('Active Notification'),
                  trailing: Switch.adaptive(
                    value: preferencesSettings.isDailyNotificationActive,
                    onChanged: (value) {
                      preferencesSettings.enableDailyNotification(value);
                    },
                  ),
                ),
              ),
              Material(
                child: ListTile(
                  title: const Text('Test Notification'),
                  trailing: TextButton(
                    child: Text(
                      'Try Notification',
                      style: TextStyle(color: preferencesSettings.isDarkTheme ? Colors.white : Colors.black),
                    ),
                    onPressed: () {},
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
