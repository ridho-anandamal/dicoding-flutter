import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  static const String pageName = 'Favorit';
  const FavoritePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
      ),
      body: Center(
        child: Text(
          'Fitur ini sedang tahap pengembangan ya!',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}