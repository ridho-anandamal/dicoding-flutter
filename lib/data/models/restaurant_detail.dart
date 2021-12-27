class RestaurantDataDetailResult {
  RestaurantDataDetailResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  final bool error;
  final String message;
  final RestaurantDataDetail restaurant;

  factory RestaurantDataDetailResult.fromJson(Map<String, dynamic> json) =>
      RestaurantDataDetailResult(
        error: json['error'],
        message: json['message'],
        restaurant: RestaurantDataDetail.fromJson(json['restaurant']),
      );

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'restaurant': restaurant,
      };
}

class RestaurantDataDetail {
  RestaurantDataDetail({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.rating,
    this.categories,
    this.menus,
    this.customerReviews,
  });

  final String? id;
  final String? name;
  final String? description;
  final String? city;
  final String? address;
  final String? pictureId;
  final double? rating;
  final List<Category>? categories;
  final Menus? menus;
  final List<CustomerReview>? customerReviews;

  factory RestaurantDataDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDataDetail(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        rating: json['rating'].toDouble(),
        categories: List<Category>.from(
            json['categories'].map((item) => Category.fromJson(json))),
        menus: Menus.fromJson(json['menus']),
        customerReviews: List<CustomerReview>.from(json['customerReviews']
            .map((item) => CustomerReview.fromJson(item))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'city': city,
        'address': address,
        'pictureId': pictureId,
        'categories': List<dynamic>.from(categories!.map((x) => x.toJson())),
        'rating': rating,
        'customerReviews':
            List<dynamic>.from(customerReviews!.map((x) => x.toJson()))
      };

  factory RestaurantDataDetail.fromJsonFavorite(Map<String, dynamic> json) =>
      RestaurantDataDetail(
        id: json['id'],
        name: json['name'],
        city: json['city'],
        pictureId: json['pictureId'],
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJsonFavorite() => {
        'id': id,
        'name': name,
        'city': city,
        'pictureId': pictureId,
        'rating': rating,
      };
}

class Category {
  Category({
    required this.name,
  });

  final String name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json['name']);

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  final String name;
  final String review;
  final String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json['name'],
        review: json['review'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'date': date,
      };
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<MenusItem> foods;
  final List<MenusItem> drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<MenusItem>.from(
            json['foods'].map((item) => MenusItem.fromJson(item))),
        drinks: List<MenusItem>.from(
            json['drinks'].map((item) => MenusItem.fromJson(item))),
      );
}

class MenusItem {
  MenusItem({required this.name});

  final String name;

  factory MenusItem.fromJson(Map<String, dynamic> json) =>
      MenusItem(name: json['name']);
}
