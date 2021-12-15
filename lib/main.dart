import 'package:flutter/material.dart';
import 'package:submission/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[800],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[700],
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              fontFamily: 'Poppins'
            ),
      ),
      title: "Flutter Demo",
      home: const MainScreen(),
    );
  }
}
