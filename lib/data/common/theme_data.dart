import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: whiteColor,
          onPrimary: blackColor,
          secondary: redColor500,
        ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    scaffoldBackgroundColor: whiteColor,
    textTheme: myTextTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: redColor500,
      unselectedItemColor: greyColor,
      enableFeedback: false,
      selectedIconTheme: IconThemeData(
        size: 20,
      ),
      unselectedIconTheme: IconThemeData(
        size: 20,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: whiteColor,
    )
  );
}
