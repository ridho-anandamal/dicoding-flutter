import 'package:submission_restaurant/data/models/restaurant_detail.dart';

class CustomerReviewResult {
  final bool error;
  final String message;
  final List<CustomerReview> customerReview;

  CustomerReviewResult(
      {required this.error,
      required this.message,
      required this.customerReview});

  factory CustomerReviewResult.fromJson(Map<String, dynamic> json) =>
      CustomerReviewResult(
          error: json['error'],
          message: json['message'],
          customerReview: List<CustomerReview>.from(json['customerReviews']
              .map((item) => CustomerReview.fromJson(item))));
}
