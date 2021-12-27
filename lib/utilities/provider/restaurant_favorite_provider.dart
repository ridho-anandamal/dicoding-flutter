import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/common/style.dart';
import 'package:submission_restaurant/data/database/database_favorite.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/utilities/helper/enum_result_state.dart';

class RestaurantFavoriteDatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  RestaurantFavoriteDatabaseProvider({required this.databaseHelper}) {
    _getFavoriteRestaurant();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  bool _isFavorite = false;
  set isFavorite(value) {
    _isFavorite = value;
    notifyListeners();
  }
  bool get isFavorite => _isFavorite;

  Color get colorRating => _isFavorite ? Colors.green : Colors.orange;
  Color get colorIsLikedBackground => _isFavorite ? redColor500 : redColor50;
  Color get colorIsLikedText => _isFavorite ? Colors.white : redColor500;

  List<RestaurantDataDetail> _favorite = [];
  List<RestaurantDataDetail> get favorite => _favorite;

  void _getFavoriteRestaurant() async {
    _favorite = await databaseHelper.getFavorites();
    if (_favorite.length > 0) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(RestaurantDataDetail restaurantDataDetail) async {
    try {
      await databaseHelper.insertFavorite(restaurantDataDetail);
      _getFavoriteRestaurant();
    } catch (error) {
      _state = ResultState.error;
      print(error.toString());
      _message = '$error';
      notifyListeners();
    }
  }

  Future<bool> isFavoriteRestaurant(String id) async {
    final favoriteRestaurant = await databaseHelper.getFavoriteById(id);
    _isFavorite = favoriteRestaurant.isNotEmpty;
    return favoriteRestaurant.isNotEmpty;
  }

  void removeFavoriteRestaurant(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavoriteRestaurant();
    } catch (error) {
      print(error.toString());
      _state = ResultState.error;
      _message = '$error';
      notifyListeners();
    }
  }
}
