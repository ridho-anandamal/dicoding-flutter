import 'package:sqflite/sqflite.dart';
import 'package:submission_restaurant/data/models/restaurant_detail.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tableFavoriteRestaurant = 'favoriteRestaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    print('Membuat database $_tableFavoriteRestaurant');
    var db = openDatabase(
      '$path/restaurant-favorite.db',
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableFavoriteRestaurant (
          id TEXT PRIMARY KEY,
          name TEXT,
          city TEXT,
          pictureId TEXT,
          rating REAL)
        ''');
      },
      version: 1,
    );
    print('Membuat berhasil $db');
    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();
    return _database;
  }

  Future<void> insertFavorite(RestaurantDataDetail restaurantDataDetail) async {
    final db = await database;
    final console = await db!.insert(
        _tableFavoriteRestaurant, restaurantDataDetail.toJsonFavorite());
    print('tambah bookmark $console');
  }

  Future<List<RestaurantDataDetail>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db!.query(_tableFavoriteRestaurant);
    final console =
        result.map((res) => RestaurantDataDetail.fromJsonFavorite(res)).toList();
    print('mengambil favorites $console');
    return console;
  }

  Future<Map> getFavoriteById (String id) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db!.query(_tableFavoriteRestaurant, where: 'id = ?', whereArgs: [id]);

    if(result.isNotEmpty){
      return result.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    final console = await db!.delete(
      _tableFavoriteRestaurant,
      where: 'id = ?',
      whereArgs: [id],
    );
    print('Menghapus $console');
  }
}
