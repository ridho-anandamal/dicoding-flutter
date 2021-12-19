import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/models/restaurant_model.dart';
import 'package:submission_restaurant/widget/component_tags.dart';
import 'package:submission_restaurant/widget/container_bottom.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';
import 'package:submission_restaurant/widget/container_tags.dart';
import 'package:submission_restaurant/widget/container_text.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail-page';
  static const String pageName = 'Detail Restaurant';
  final Restaurant restaurant;
  final bool isLiked = false;
  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  Color _colorRating() => restaurant.rating >= 4 ? Colors.green : Colors.orange;
  Color _colorIsLikedBackground() => isLiked ? redColor500 : redColor50;
  Color _colorIsLikedText() => isLiked ? Colors.white : redColor500;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Hero(
                  tag: 'restaurant-hero${restaurant.id}',
                  child: Image.network(
                    restaurant.pictureId,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 220),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            restaurant.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Kota ${restaurant.city}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              ComponentTagText(
                                text: '★ ${restaurant.rating}',
                                backgroundColor: _colorRating(),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ContainerText(
                      title: 'Deskripsi',
                      restaurantString: restaurant.description,
                    ),
                    ContainerTags(
                      restaurantList: restaurant.menus.foods,
                      title: 'Menu Makanan',
                    ),
                    ContainerTags(
                      restaurantList: restaurant.menus.drinks,
                      title: 'Menu Minuman',
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ],
            ),
          ),
          ContainerBottom(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(_colorIsLikedBackground()),
                      foregroundColor:
                          MaterialStateProperty.all(_colorIsLikedText()),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      overlayColor: MaterialStateProperty.all(redColor100),
                    ),
                    onPressed: () {},
                    child: const Text('Sukai'),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      overlayColor:
                          MaterialStateProperty.all(Colors.green[600]),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Beri Review'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(pageName),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Hero(
                  tag: 'restaurant-hero${restaurant.id}',
                  child: Image.network(
                    restaurant.pictureId,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 220),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            restaurant.name,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Kota ${restaurant.city}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              ComponentTagText(
                                text: '★ ${restaurant.rating}',
                                backgroundColor: _colorRating(),
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ContainerText(
                      title: 'Deskripsi',
                      restaurantString: restaurant.description,
                    ),
                    ContainerTags(
                      restaurantList: restaurant.menus.foods,
                      title: 'Menu Makanan',
                    ),
                    ContainerTags(
                      restaurantList: restaurant.menus.drinks,
                      title: 'Menu Minuman',
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ],
            ),
          ),
          ContainerBottom(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(_colorIsLikedBackground()),
                      foregroundColor:
                          MaterialStateProperty.all(_colorIsLikedText()),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      overlayColor: MaterialStateProperty.all(redColor100),
                    ),
                    onPressed: () {},
                    child: const Text('Sukai'),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      overlayColor:
                          MaterialStateProperty.all(Colors.green[600]),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Beri Review'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
