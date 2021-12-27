import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/utilities/helper/enum_result_state.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_search_provider.dart';
import 'package:submission_restaurant/widget/item_list_view.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';

class SearchPage extends StatelessWidget {
  static const String routeName = '/search';
  static const String pageName = 'Search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (context) => RestaurantSearchProvider(),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<RestaurantSearchProvider>(
            builder: (context, restaurantSearchProvider, _) {
          return TextField(
            decoration: const InputDecoration(
              hintText: 'Cari Restaurant',
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: redColor500),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
            ),
            cursorColor: Colors.black,
            onChanged: (value) {
              restaurantSearchProvider.queryValue = value;
            },
          );
        }),
      ),
      body: _getSearchRestaurant(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: _getSearchRestaurant(context),
    );
  }

  Widget _getSearchRestaurant(BuildContext context) {
    return Consumer<RestaurantSearchProvider>(
      builder: (context, restaurantSearchProvider, _) {
        if (restaurantSearchProvider.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(color: redColor500),
          );
        } else if (restaurantSearchProvider.state == ResultState.hasData) {
          return ItemListView(
              restaurants:
                  restaurantSearchProvider.dataListResult!.restaurants);
        } else if (restaurantSearchProvider.state == ResultState.error) {
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
                    restaurantSearchProvider.message.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          );
        } else if (restaurantSearchProvider.state == ResultState.hasData) {
          return Center(
            child: Text(
              restaurantSearchProvider.message.toString(),
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
