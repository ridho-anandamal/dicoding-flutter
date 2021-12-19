import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';
import 'package:submission_restaurant/screen/detail_page.dart';

class ListPage extends StatefulWidget {
  static const String pageName = 'Restaurant';
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<RestaurantDataListResult> _restaurantList;
  bool _isSearching = false;
  bool _isGridView = false;

  @override
  void initState() {
    super.initState();
    _restaurantList = ApiRestaurant.getRestaurantList();
  }

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
        title: _isSearching
            ? TextField(
                decoration: const InputDecoration(
                  hintText: 'Cari Restaurant',
                ),
                onSubmitted: (value) {
                  setState(() {
                    _restaurantList = ApiRestaurant.getSearchList(value);
                  });
                },
              )
            : const Text(ListPage.pageName),
        leading: _isSearching
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _restaurantList = ApiRestaurant.getRestaurantList();
                  });
                },
              )
            : null,
        actions: _isSearching
            ? [Container()]
            : [
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                ),
                _isGridView
                    ? IconButton(
                        icon: const Icon(Icons.grid_view_rounded),
                        onPressed: () {
                          setState(() => _isGridView = false);
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.view_list),
                        onPressed: () {
                          setState(() => _isGridView = true);
                        },
                      ),
              ],
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildList(context),
      navigationBar: const CupertinoNavigationBar(
        middle: Text(ListPage.pageName),
        transitionBetweenRoutes: false,
      ),
    );
  }

  Widget _buildList(context) {
    return FutureBuilder(
      future: _restaurantList,
      builder: (context, AsyncSnapshot<RestaurantDataListResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            var restaurants = snapshot.data?.restaurants;
            return _isGridView
                ? _buildItemGridView(context, restaurants!)
                : _buildItemListView(context, restaurants!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Text('');
          }
        }
      },
    );
  }

  Widget _buildItemListView(
      BuildContext context, List<RestaurantDataList> restaurant) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: restaurant.length,
      itemBuilder: (context, index) {
        Color _colorRating() =>
            restaurant[index].rating >= 4 ? Colors.green : Colors.orange;
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
              restaurant[index].name,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis
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
      },
    );
  }

  Widget _buildItemGridView(
      BuildContext context, List<RestaurantDataList> restaurants) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView.count(
        childAspectRatio: 10 / 12,
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: restaurants.map((restaurant) {
          Color _colorRating() =>
              restaurant.rating >= 4 ? Colors.green : Colors.orange;

          return InkWell(
            onTap: () => Navigator.pushNamed(context, DetailPage.routeName,
                arguments: restaurant.id),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'restaurant-hero${restaurant.id}',
                  child: Image.network(
                    '${ApiRestaurant.baseUrl}${ApiRestaurant.getImageUrl}${restaurant.pictureId}',
                    width: double.infinity,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis
                            ),
                      ),
                      const SizedBox(height: 6),
                      Row(
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
                      const SizedBox(height: 6),
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
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
