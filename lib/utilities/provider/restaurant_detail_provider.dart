import 'package:flutter/material.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/utilities/helper/enum_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  RestaurantDetailProvider({required this.idRestaurant}) {
    _getDetailRestaurant();
    notifyListeners();
  }

  String idRestaurant;
  RestaurantDataDetailResult? _dataDetailResult;
  ResultState? _resultState;
  late String _message = '';

  String get message => _message;
  RestaurantDataDetailResult? get dataListResult => _dataDetailResult;
  ResultState? get state => _resultState;
  dynamic get refreshData {
    _getDetailRestaurant();
    notifyListeners();
    return;
  }


  Future<dynamic> _getDetailRestaurant() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      RestaurantDataDetailResult restaurantData =
          await ApiRestaurant.getRestaurantDetail(idRestaurant);
      // ignore: unnecessary_null_comparison
      if (restaurantData.restaurant == null) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _dataDetailResult = restaurantData;
      }
    } catch (error) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Koneksi terputus. Data tidak ditemukan';
    }
  }
}
