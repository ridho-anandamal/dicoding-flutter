import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/common/navigation.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/screen/detail_page.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key, required this.restaurants}) : super(key: key);
  final List<dynamic> restaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        Color _colorRating() =>
            restaurants[index].rating >= 4 ? Colors.green : Colors.orange;
        return Material(
          child: ListTile(
            minLeadingWidth: 100,
            minVerticalPadding: 10,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            leading: Hero(
              tag: 'restaurant-hero${restaurants[index].id}',
              child: Image.network(
                '${ApiRestaurant.baseUrl}${ApiRestaurant.getImageUrl}${restaurants[index].pictureId}',
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              restaurants[index].name,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
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
                          'Kota ${restaurants[index].city}',
                          style: Theme.of(context).textTheme.caption?.copyWith(
                                color: greyColor,
                              ),
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
                        '${restaurants[index].rating}',
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
            onTap: () => Navigation.intentWithData(
                DetailPage.routeName, restaurants[index].id),
          ),
        );
      },
    );
  }
}
