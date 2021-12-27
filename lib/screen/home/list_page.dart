import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/navigation.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/screen/search_page.dart';
import 'package:submission_restaurant/utilities/helper/enum_result_state.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/widget/item_grid_view.dart';
import 'package:submission_restaurant/widget/item_list_view.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';

class ListPage extends StatelessWidget {
  static const String pageName = 'Restaurant';
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantListProvider>(
      create: (context) => RestaurantListProvider(),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageName),
        actions: [
          IconButton(
            onPressed: () =>
                Navigation.intentWithData(SearchPage.routeName, ''),
            icon: const Icon(
              Icons.search_rounded,
            ),
          ),
          Consumer<RestaurantListProvider>(
            builder: (context, restaurantListProvider, _) {
              return restaurantListProvider.isGridView
                  ? IconButton(
                      onPressed: () =>
                          restaurantListProvider.isGridView = false,
                      icon: const Icon(
                        Icons.view_list,
                      ),
                    )
                  : IconButton(
                      onPressed: () => restaurantListProvider.isGridView = true,
                      icon: const Icon(
                        Icons.grid_view_rounded,
                      ),
                    );
            },
          ),
        ],
      ),
      body: _getRestaurantData(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _getRestaurantData(context),
    );
  }

  Widget _getRestaurantData(BuildContext context) {
    return Consumer<RestaurantListProvider>(
      builder: (context, restaurantListProvider, _) {
        if (restaurantListProvider.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(color: redColor500),
          );
        } else if (restaurantListProvider.state == ResultState.hasData) {
          var restaurants = restaurantListProvider.dataListResult!.restaurants;
          return restaurantListProvider.isGridView
              ? ItemGridView(restaurants: restaurants)
              : ItemListView(restaurants: restaurants);
        } else if (restaurantListProvider.state == ResultState.error) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/illustration/not-found.png',
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    restaurantListProvider.message.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ElevatedButton(
                      onPressed: () => restaurantListProvider.refreshData,
                      child: const Text('Muat Ulang'))
                ],
              ),
            ),
          );
        } else if (restaurantListProvider.state == ResultState.hasData) {
          return Center(
            child: Text(
              restaurantListProvider.message.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        } else {
          return const Text('');
        }
      },
    );
  }
}
