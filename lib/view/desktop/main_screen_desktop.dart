import 'package:flutter/material.dart';
import 'package:submission/model/FoodRecipes.dart';
import 'package:submission/detail_screen.dart';

class DesktopView extends StatelessWidget {
  final int gridCount;

  // ignore: use_key_in_widget_constructors
  const DesktopView({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(12.0),
      crossAxisCount: gridCount,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      children: foodRecipesList.map((recipes) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.blueGrey[700],
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                )
              ]),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    recipe: recipes,
                  ),
                )),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    recipes.imageCover,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Container(
                  height: 180.0,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        recipes.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          recipes.shortDescription,
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 1.6,
                            color: Colors.blueGrey[200],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
