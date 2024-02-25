import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../modal/products.dart';

class FavoriteDataBaseHelper {
  static final FavoriteDataBaseHelper instance = FavoriteDataBaseHelper._privateConstructor();
  static Database? _database;

  FavoriteDataBaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Products(
        id INTEGER PRIMARY KEY,
        title TEXT,
        price REAL,
        description TEXT,
        category TEXT,
        image TEXT,
        rating_rate REAL,
        rating_count INTEGER
      )
    ''');
  }

  Future<int> insertProduct(Products product) async {
    Database db = await instance.database;
    return await db.insert('Products', product.toDbJson());
  }
  Future<int> deleteProduct(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'Products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Products>> getProducts() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('Products');
    return List.generate(maps.length, (i) {
      return Products.fromJson(maps[i]);
    });
  }
}
