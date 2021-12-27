import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/common/navigation.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';
import 'package:submission_restaurant/screen/detail_page.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({Key? key, required this.restaurants}) : super(key: key);
  final List<RestaurantDataList> restaurants;

  get greyColor => null;

  @override
  Widget build(BuildContext context) {
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
            onTap: () =>
                Navigation.intentWithData(DetailPage.routeName, restaurant.id),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'restaurant-hero${restaurant.id}',
                  child: Image.network(
                    '${ApiRestaurant.baseUrl}${ApiRestaurant.getImageUrl}${restaurant.pictureId}',
                    width: double.infinity,
                    height: 100,
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
                            overflow: TextOverflow.ellipsis),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(color: greyColor),
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
