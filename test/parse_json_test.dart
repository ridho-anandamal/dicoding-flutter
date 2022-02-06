// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';

void main() {
  group('Menguji mengkonsumsi data JSON', () {
    var restaurants = {
      "error": false,
      "message": "success",
      "count": 20,
      "restaurants": [
        {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2
        },
        {
          "id": "s1knt6za9kkfw1e867",
          "name": "Kafe Kita",
          "description":
              "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
          "pictureId": "25",
          "city": "Gorontalo",
          "rating": 4
        }
      ]
    };

    var parseJson = RestaurantDataListResult.fromJson(restaurants);

    test('-> Parse JSON adalah model RestaurantDataListResult', () {
      var resultMessage = parseJson is RestaurantDataListResult;
      expect(resultMessage, true);
    });

    test('-> Terdapat data list restaurant', () {
      var resultList = parseJson.restaurants is List<RestaurantDataList>;
      expect(resultList, true);
    });

    test('-> Terdapat data nama restaurant "Melting Pot"', () {
      var resultRestaurantName = parseJson.restaurants.map((e) => e.name).contains('Melting Pot');
      expect(resultRestaurantName, true);
    });
  });
}
