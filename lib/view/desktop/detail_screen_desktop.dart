import 'package:flutter/material.dart';
import 'package:submission/model/FoodRecipes.dart';

class DetailDesktopView extends StatelessWidget {
  final FoodRecipes recipe;
  // ignore: use_key_in_widget_constructors
  const DetailDesktopView({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24.0),
          width: 1000.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          recipe.imageCover,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        recipe.title,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Deskripsi Menu",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe.description.map((paragraph) {
                              return Column(
                                children: [
                                  Text(
                                    paragraph,
                                    style: const TextStyle(
                                      height: 1.8,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      const Text(
                        'Tags',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: recipe.tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[700],
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blueGrey[700],
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset.zero,
                              blurRadius: 4,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bahan dibutuhkan",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe.ingredients.map((item) {
                              return Column(
                                children: [
                                  Text(
                                    "\u2022 $item",
                                    style: const TextStyle(
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.blueGrey[700],
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset.zero,
                              blurRadius: 4,
                            )
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bahan dibutuhkan",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recipe.ingredients.map((item) {
                              return Column(
                                children: [
                                  Text(
                                    "\u2022 $item",
                                    style: const TextStyle(
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
