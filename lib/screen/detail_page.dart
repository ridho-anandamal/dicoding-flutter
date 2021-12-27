import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/common/navigation.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/screen/review_restaurant_page.dart';
import 'package:submission_restaurant/utilities/helper/enum_result_state.dart';
import 'package:submission_restaurant/utilities/provider/preferences_settings_provider.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_detail_provider.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_favorite_provider.dart';
import 'package:submission_restaurant/widget/component_tags.dart';
import 'package:submission_restaurant/widget/container_bottom.dart';
import 'package:submission_restaurant/widget/container_review.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';
import 'package:submission_restaurant/widget/container_tags.dart';
import 'package:submission_restaurant/widget/container_text.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = '/detail';
  static const String pageName = 'Detail';
  final String idRestaurant;
  const DetailPage({Key? key, required this.idRestaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (context) => RestaurantDetailProvider(idRestaurant: idRestaurant),
      child: PlatformWidget(
        androidBuilder: _buildAndroid,
        iosBuilder: _buildIos,
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigation.back(),
        ),
        title: const Text(DetailPage.pageName),
      ),
      body: _getDetailRestaurant(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(DetailPage.pageName),
      ),
      child: _getDetailRestaurant(context),
    );
  }

  Widget _getDetailRestaurant(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(
      builder: (context, restaurantDetailProvider, _) {
        if (restaurantDetailProvider.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(color: redColor500),
          );
        } else if (restaurantDetailProvider.state == ResultState.hasData) {
          return _detailBuilder(
              context, restaurantDetailProvider.dataListResult!.restaurant);
        } else if (restaurantDetailProvider.state == ResultState.error) {
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
                    restaurantDetailProvider.message.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ElevatedButton(
                      onPressed: () => restaurantDetailProvider.refreshData,
                      child: const Text('Muat Ulang'))
                ],
              ),
            ),
          );
        } else if (restaurantDetailProvider.state == ResultState.hasData) {
          return Center(
            child: Text(
              restaurantDetailProvider.message.toString(),
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

  Widget _detailBuilder(BuildContext context, RestaurantDataDetail restaurant) {
    return Consumer<PreferencecsSettingsProvider>(
      builder: (context, preferencesSettings, _) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Hero(
                    tag: 'restaurant-hero${restaurant.id}',
                    child: Image.network(
                      '${ApiRestaurant.baseUrl}${ApiRestaurant.getImageUrl}${restaurant.pictureId}',
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: preferencesSettings.isDarkTheme
                            ? darkModeBlackColor
                            : whiteColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, -12),
                            color: Color(0x4F000000),
                            blurRadius: 12,
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name!,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          '${restaurant.address}, Kota ${restaurant.city}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Consumer<RestaurantDetailProvider>(
                            builder: (context, restaurantDataProvider, _) {
                          return ComponentTagText(
                            text: '★ ${restaurant.rating}',
                            backgroundColor: restaurant.rating! >= 4
                                ? Colors.green
                                : Colors.orange,
                            textColor: Colors.white,
                          );
                        }),
                        ContainerText(
                          title: 'Deskripsi',
                          restaurantString: restaurant.description!,
                        ),
                        ContainerTags(
                          restaurantList: restaurant.menus!.foods,
                          title: 'Menu Makanan',
                        ),
                        ContainerTags(
                          restaurantList: restaurant.menus!.drinks,
                          title: 'Menu Minuman',
                        ),
                        ContainerTags(
                            title: 'Kategori',
                            restaurantList: restaurant.categories!),
                        ContainerReview(
                            title: 'Review Customer',
                            costumerReview: restaurant.customerReviews!),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ContainerBottom(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<RestaurantFavoriteDatabaseProvider>(
                      builder:
                          (context, restaurantFavoriteDatabaseProvider, _) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                restaurantFavoriteDatabaseProvider
                                    .colorIsLikedBackground),
                            foregroundColor: MaterialStateProperty.all(
                                restaurantFavoriteDatabaseProvider
                                    .colorIsLikedText),
                            elevation: MaterialStateProperty.all(0),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 12.0),
                            ),
                            overlayColor:
                                MaterialStateProperty.all(redColor100),
                          ),
                          onPressed: () async {
                            final checkData =
                                await restaurantFavoriteDatabaseProvider
                                    .isFavoriteRestaurant(restaurant.id!);

                            if (checkData == false) {
                              restaurantFavoriteDatabaseProvider
                                  .addFavorite(restaurant);
                              SnackBar snackBar = SnackBar(
                                  content: Text(
                                      'Restaurant ${restaurant.name} Menjadi Favorit'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              restaurantFavoriteDatabaseProvider
                                  .removeFavoriteRestaurant(restaurant.id!);
                              SnackBar snackBar = SnackBar(
                                  content: Text(
                                      'Restaurant ${restaurant.name} Dihapus'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text('Sukai'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        overlayColor:
                            MaterialStateProperty.all(Colors.green[600]),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12.0),
                        ),
                      ),
                      onPressed: () {
                        Navigation.intentWithData(
                            ReviewRestaurantPage.routeName, restaurant);
                      },
                      child: const Text('Beri Review'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
