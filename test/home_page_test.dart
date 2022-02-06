import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:submission_restaurant/data/database/database_favorite.dart';
import 'package:submission_restaurant/data/models/restaurant_list.dart';
import 'package:submission_restaurant/screen/home/favorite_page.dart';
import 'package:submission_restaurant/utilities/provider/restaurant_favorite_provider.dart';


Widget createHomeScreen() => ChangeNotifierProvider<RestaurantFavoriteDatabaseProvider>(
      create: (context) => RestaurantFavoriteDatabaseProvider(databaseHelper: DatabaseHelper()),
      child: const MaterialApp(
        home: FavoritePage(),
      ),
    );

void main() {
  group('Menguji Widget Home Screen', () {
    testWidgets('-> ListView dapat tampil', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets('-> Scroll ListView', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}