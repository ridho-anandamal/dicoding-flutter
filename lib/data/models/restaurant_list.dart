class RestaurantDataListResult {
  RestaurantDataListResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  final bool error;
  final String? message;
  final int? count;
  final List<RestaurantDataList> restaurants;

  factory RestaurantDataListResult.fromJson(Map<String, dynamic> json) =>
      RestaurantDataListResult(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<RestaurantDataList>.from(json['restaurants']
            .map((restaurant) => RestaurantDataList.fromJson(restaurant))),
      );
}

class RestaurantDataList {
  RestaurantDataList({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  factory RestaurantDataList.fromJson(Map<String, dynamic> json) =>
      RestaurantDataList(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        pictureId: json['pictureId'],
        city: json['city'],
        rating: json['rating'].toDouble(),
      );
}
