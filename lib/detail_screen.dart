import 'package:flutter/material.dart';
import 'package:submission/model/FoodRecipes.dart';
import 'package:submission/view/mobile/detail_screen_mobile.dart';
import 'package:submission/view/desktop/detail_screen_desktop.dart';

class DetailScreen extends StatelessWidget {
  final FoodRecipes recipe;

  // ignore: use_key_in_widget_constructors
  const DetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Resep'),
      ),
      floatingActionButton: const FloatingLoveButton(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if(constraints.maxWidth <= 600){
              return DetailMobileView(recipe: recipe,);
            }else {
              return DetailDesktopView(recipe: recipe,);
            }
          },
        ),
      ),
    );
  }
}

class FloatingLoveButton extends StatefulWidget {
  const FloatingLoveButton({Key? key}) : super(key: key);

  @override
  _FloatingLoveButtonState createState() => _FloatingLoveButtonState();
}

class _FloatingLoveButtonState extends State<FloatingLoveButton> {
  var isLike = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() => isLike = !isLike);
      },
      child: isLike ? const Icon(Icons.favorite_rounded) : const Icon(Icons.favorite_outline_rounded),
      backgroundColor: isLike ? Colors.pink : Colors.blue,
    );
  }
}
