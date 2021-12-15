import 'package:flutter/material.dart';
import 'package:submission/model/FoodRecipes.dart';
import 'package:submission/detail_screen.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final FoodRecipes recipes = foodRecipesList[index];
        return Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(top:16.0, left: 16.0, right: 16.0),
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
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    recipes.imageCover,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: foodRecipesList.length,
    );
  }
}
