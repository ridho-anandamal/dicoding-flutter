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
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(redColor100),
      foregroundColor: MaterialStateProperty.all(redColor500),
    )),
    inputDecorationTheme: InputDecorationTheme(
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: redColor500)),
      enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
      hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontFamily: plusJakartaSans,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
    ),
  );
}
