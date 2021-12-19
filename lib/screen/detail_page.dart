import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/widget/component_tags.dart';
import 'package:submission_restaurant/widget/container_bottom.dart';
import 'package:submission_restaurant/widget/container_review.dart';
import 'package:submission_restaurant/widget/platform_widget.dart';
import 'package:submission_restaurant/widget/container_tags.dart';
import 'package:submission_restaurant/widget/container_text.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = '/detail-page';
  static const String pageName = 'Detail Restaurant';
  final String idRestaurant;

  const DetailPage({Key? key, required this.idRestaurant}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<RestaurantDataDetailResult> _detailResult;
  bool isLiked = false;
  Color _colorRating() => isLiked ? Colors.green : Colors.orange;
  Color _colorIsLikedBackground() => isLiked ? redColor500 : redColor50;
  Color _colorIsLikedText() => isLiked ? Colors.white : redColor500;

  @override
  void initState() {
    super.initState();
    _detailResult = ApiRestaurant.getRestaurantDetail(widget.idRestaurant);
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
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _detailFutureBuilder(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(DetailPage.pageName),
      ),
      child: _detailFutureBuilder(context),
    );
  }

  Widget _detailFutureBuilder(BuildContext context) {
    return FutureBuilder(
      future: _detailResult,
      builder: (context, AsyncSnapshot<RestaurantDataDetailResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return _detailBuilder(context, snapshot.data!.restaurant);
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

  Widget _detailBuilder(BuildContext context, RestaurantDataDetail restaurant) {
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
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24),
                    ),
                    boxShadow: [
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
                      restaurant.name,
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
                    ComponentTagText(
                      text: '★ ${restaurant.rating}',
                      backgroundColor: _colorRating(),
                      textColor: Colors.white,
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
                    ContainerTags(
                        title: 'Kategori',
                        restaurantList: restaurant.categories),
                    ContainerReview(
                        title: 'Review Customer',
                        costumerReview: restaurant.customerReviews),
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
                    overlayColor: MaterialStateProperty.all(Colors.green[600]),
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
    );
  }
}
