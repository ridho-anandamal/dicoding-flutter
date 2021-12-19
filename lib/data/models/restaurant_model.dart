import 'dart:convert';

class Restaurant {
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late dynamic rating;
  late Menus menus;

  static const String jsonFile = 'assets/json/restaurant.json';

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurantList){
    id = restaurantList['id'];
    name = restaurantList['name'];
    description = restaurantList['description'];
    pictureId = restaurantList['pictureId'];
    city = restaurantList['city'];
    rating = restaurantList['rating'];
    menus = Menus.fromJson(restaurantList['menus']);
  }
}

class Menus {
    Menus({
        required this.foods,
        required this.drinks,
    });

    late List<dynamic> foods;
    late List<dynamic> drinks;

    Menus.fromJson(Map<String, dynamic> menus){
      foods = menus['foods'];
      drinks = menus['drinks'];
    }
}

List<Restaurant> parseRestaurant(String? json){
  if(json == null){
    return [];
  }
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}