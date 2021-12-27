import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_favorite_provider.dart';
import 'package:submission_restaurant/widget/item_list_view.dart';
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
    return ItemListView(
        restaurants: restaurantFavoriteDatabaseProvider.favorite);
  });
}
