import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/models/restaurant_model.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';
import 'package:submission_restaurant/screen/detail_page.dart';

class ListPage extends StatelessWidget {
  static const String pageName = 'Restaurant';
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(pageName),
        transitionBetweenRoutes: false,
      ),
    );
  }

  Widget _buildList(context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(Restaurant.jsonFile),
      builder: (context, snapshot) {
        final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return _buildItem(context, restaurants[index]);
          },
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, Restaurant restaurant) {
    Color _colorRating() =>
        restaurant.rating >= 4 ? Colors.green : Colors.orange;
    return Material(
      child: ListTile(
        minLeadingWidth: 100,
        minVerticalPadding: 10,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        leading: Hero(
          tag: 'restaurant-hero${restaurant.id}',
          child: Image.network(
            restaurant.pictureId,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          restaurant.name,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.w700,
              ),
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
                    color: greyColor,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Expanded(
                    child: Text(
                      'Kota ${restaurant.city}',
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
                    '${restaurant.rating}',
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
            arguments: restaurant),
      ),
    );
  }
}
