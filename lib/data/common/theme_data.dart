import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: whiteColor,
    onPrimary: blackColor,
    secondary: redColor500,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  scaffoldBackgroundColor: whiteColor,
  textTheme: myTextTheme.apply(
    bodyColor: blackColor,
    decorationColor: blackColor,
    displayColor: blackColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: redColor500,
    unselectedItemColor: greyColor,
    enableFeedback: false,
    selectedIconTheme: IconThemeData(size: 20),
    unselectedIconTheme: IconThemeData(size: 20),
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
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
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: redColor500)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
    hintStyle: TextStyle(
      fontFamily: plusJakartaSans,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(redColor400),
    trackColor: MaterialStateProperty.all(redColor200),
    overlayColor: MaterialStateProperty.all(greyColor),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: darkModeBlackColor,
    onPrimary: whiteColor,
    secondary: redColor500,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  scaffoldBackgroundColor: darkModeBlackColor,
  textTheme: myTextTheme.apply(
    bodyColor: whiteColor,
    decorationColor: whiteColor,
    displayColor: whiteColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: darkModeBlackColor,
    selectedItemColor: redColor300,
    unselectedItemColor: greyColor,
    enableFeedback: false,
    selectedIconTheme: IconThemeData(size: 20),
    unselectedIconTheme: IconThemeData(size: 20),
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedLabelStyle: TextStyle(fontSize: 12),
  ),
  listTileTheme: const ListTileThemeData(tileColor: darkModeBlackColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(redColor100),
    foregroundColor: MaterialStateProperty.all(redColor500),
  )),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: redColor500)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: blackColor)),
    hintStyle: TextStyle(
      fontFamily: plusJakartaSans,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(redColor400),
    trackColor: MaterialStateProperty.all(redColor200),
    overlayColor: MaterialStateProperty.all(greyColor),
  ),
);
