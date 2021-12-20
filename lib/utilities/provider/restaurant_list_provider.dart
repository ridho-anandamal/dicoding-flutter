import 'package:flutter/foundation.dart';
import 'package:submission_restaurant/data/api/api_restaurant.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantListProvider extends ChangeNotifier {
  RestaurantListProvider() {
    _getListRestaurant();
    notifyListeners();
  }

  RestaurantDataListResult? _dataListResult;
  ResultState? _resultState;
  late String _message = '';
  bool _isGridView = false;

  bool get isGridView => _isGridView;
  set isGridView(value) {
    _isGridView = value;
    notifyListeners();
  }

  String get message => _message;
  RestaurantDataListResult? get dataListResult => _dataListResult;
  ResultState? get state => _resultState;
  dynamic get refreshData=> _getListRestaurant();

  Future<dynamic> _getListRestaurant() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      RestaurantDataListResult restaurantList =
          await ApiRestaurant.getRestaurantList();
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
      return _message = 'Koneksi terputus. Data tidak ditemukan';
    }
  }
}
