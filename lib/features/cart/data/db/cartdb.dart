import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/cart_product_model.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cart_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE CartProducts(
        productId INTEGER PRIMARY KEY,
        quantity INTEGER
      )
    ''');
  }

  Future<int> insertCartProduct(CartProductModel cartProduct) async {
    Database db = await instance.database;
    return await db.insert('CartProducts', cartProduct.toJson());
  }

  Future<List<CartProductModel>> getCartProducts() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('CartProducts');
    return List.generate(maps.length, (i) {
      return CartProductModel(
        productId: maps[i]['productId'],
        quantity: maps[i]['quantity'],
      );
    });
  }

  Future<int> updateCartProduct(CartProductModel cartProduct) async {
    Database db = await instance.database;
    return await db.update(
      'CartProducts',
      cartProduct.toJson(),
      where: 'productId = ?',
      whereArgs: [cartProduct.productId],
    );
  }

  Future<int> deleteCartProduct(int productId) async {
    Database db = await instance.database;
    return await db.delete(
      'CartProducts',
      where: 'productId = ?',
      whereArgs: [productId],
    );
  }
}
