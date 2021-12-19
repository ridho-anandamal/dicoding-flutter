import 'dart:convert';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';
import 'package:http/http.dart' as http;

class ApiRestaurant {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  static const getListUrl = '/list';
  static const getImageUrl = '/images/small/';
  static const getDetailUrl = '/detail/';

  static Future<RestaurantDataListResult> getRestaurantList() async {
    final response = await http.get(Uri.parse('$baseUrl$getListUrl'));
    if (response.statusCode == 200) {
      return RestaurantDataListResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mengambil list restaurant');
    }
  }

  static Future<RestaurantDataDetailResult> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl$getDetailUrl$id'));
    if (response.statusCode == 200) {
      return RestaurantDataDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mengambil detail restaurant');
    }
  }
}
