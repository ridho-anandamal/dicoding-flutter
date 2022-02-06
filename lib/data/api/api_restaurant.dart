import 'dart:convert';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';
import 'package:http/http.dart' as http;

class ApiRestaurant {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  static const getListUrl = '/list';
  static const getImageUrl = '/images/small/';
  static const getDetailUrl = '/detail/';
  static const getSearchUrl = '/search?q=';
  static const postReviewUrl = '/review';

  static Future<RestaurantDataListResult> getRestaurantList() async {
    final response = await http.get(Uri.parse('$baseUrl$getListUrl'));
      if (response.statusCode == 200) {
        return RestaurantDataListResult.fromJson(json.decode(response.body));
      } else {
        throw Exception('Gagal mengambil list restaurant');
      }
  }

  static Future<RestaurantDataDetailResult> getRestaurantDetail(
      String id) async {
    final response = await http.get(Uri.parse('$baseUrl$getDetailUrl$id'));
    if (response.statusCode == 200) {
      return RestaurantDataDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mengambil detail restaurant');
    }
  }

  static Future<RestaurantDataListResult> getSearchList(String query) async {
    final response = await http.get(Uri.parse('$baseUrl$getSearchUrl$query'));
    if (response.statusCode == 200) {
      return RestaurantDataListResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Restaurant tidak ditemukan');
    }
  }

  static Future<void> postReview(
      {required String name,
      required String review,
      required String id}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$postReviewUrl'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, String>{
          'name': name,
          'review': review,
          'id': id,
        },
      ),
    );
    if (response.statusCode == 201) {
      return;
    // ignore: unnecessary_null_comparison
    } else if (response == null) {
      throw Exception('Tidak ada koneksi internet');
    } else {
      throw Exception('Gagal mengirim data');
    }
  }
}
