import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/screen/detail_page.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_favorite_provider.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';

class FavoritePage extends StatelessWidget {
  static const String pageName = 'Favorit';
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
      ),
      body: _buildList(context),
    );
  }
}

Widget _buildIos(BuildContext context) {
  return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Restaurant'),
      ),
      child: _buildList(context));
}

Widget _buildList(BuildContext context) {
  return Consumer<RestaurantFavoriteDatabaseProvider>(
      builder: (context, restaurantFavoriteDatabaseProvider, child) {
    return ListView.builder(
        itemCount: restaurantFavoriteDatabaseProvider.favorite.length,
        itemBuilder: (context, index) {
          var restaurant = restaurantFavoriteDatabaseProvider.favorite;
          Color _colorRating() =>
              restaurant[index].rating! >= 4 ? Colors.green : Colors.orange;
          return Material(
            child: ListTile(
              minLeadingWidth: 100,
              minVerticalPadding: 10,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              leading: Hero(
                tag: 'restaurant-hero${restaurant[index].id}',
                child: Image.network(
                  '${ApiRestaurant.baseUrl}${ApiRestaurant.getImageUrl}${restaurant[index].pictureId}',
                  width: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                restaurant[index].name!,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis),
              ),
              subtitle: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Platform.isIOS
                              ? CupertinoIcons.location
                              : Icons.location_city,
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        Expanded(
                          child: Text(
                            'Kota ${restaurant[index].city}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Platform.isIOS ? CupertinoIcons.star : Icons.star,
                        size: 16.0,
                        color: _colorRating(),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Expanded(
                        child: Text(
                          '${restaurant[index].rating}',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: _colorRating()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
                  arguments: restaurant[index].id),
            ),
          );
        });
  });
}
