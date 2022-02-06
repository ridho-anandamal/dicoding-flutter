import 'package:flutter/foundation.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantSearchProvider extends ChangeNotifier {

  RestaurantDataListResult? _dataListResult;
  ResultState? _resultState;
  late String _message = '';

  set queryValue(query){
    _searchListRestaurant(query);
    notifyListeners();
  }
  String get message => _message;
  RestaurantDataListResult? get dataListResult => _dataListResult;
  ResultState? get state => _resultState;

  Future<dynamic> _searchListRestaurant(value) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      RestaurantDataListResult restaurantList =
          await ApiRestaurant.getSearchList(value);
      if (restaurantList.restaurants.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _dataListResult = restaurantList;
      }
    } catch (error) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Data belum ditemukan';
    }
  }
}
