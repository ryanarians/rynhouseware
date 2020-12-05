// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:rynhouseware/model/produk.dart';

// class DatabaseHelper {
//   static const _databaseName = 'ProdukData.db';
//   static const _databaseVersion = 1;

//   //singleton class
//   DatabaseHelper._();
//   static final DatabaseHelper instance = DatabaseHelper._();

//   Database _database;
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     _database = await _initDatabase();
//     return _database;
//   }

//   _initDatabase() async {
//     Directory dataDirectory = await getApplicationDocumentsDirectory();
//     String dbPath = join(dataDirectory.path, _databaseName);
//     return await openDatabase(dbPath,
//         version: _databaseVersion, onCreate: _onCreateDB);
//   }

//   _onCreateDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE ${Produk.tblProduk}(
//         ${Produk.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
//         ${Produk.colName} TEXT NOT NULL,
//         ${Produk.colPrice} TEXT NOT NULL,
//         ${Produk.colOldprice} TEXT NOT NULL
//       )

//      ''');
//   }

//   Future<int> insertProduk(Produk produk) async {
//     Database db = await database;
//     return await db.insert(Produk.tblProduk, produk.toMap());
//   }

//   Future<List<Produk>> fetchProduks() async {
//     Database db = await database;
//     List<Map> produks = await db.query(Produk.tblProduk);
//     return produks.length == 0
//         ? []
//         : produks.map((e) => Produk.fromMap(e)).toList();
//   }
// }

import 'dart:io';

import 'package:rynhouseware/model/produk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'ContactDatabase.db';
  static const _databaseVersion = 1;

  //singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    print(dbPath);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    //create tables
    await db.execute('''
      CREATE TABLE ${Produk.tblProduk}(
        ${Produk.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${Produk.colName} TEXT NOT NULL,
        ${Produk.colPrice} TEXT NOT NULL,
        ${Produk.colOldprice} TEXT NOT NULL,
        ${Produk.colImage} TEXT
      )
      ''');
  }

  //contact - insert
  Future<int> insertProduk(Produk produk) async {
    Database db = await database;
    return await db.insert(Produk.tblProduk, produk.toMap());
  }

//contact - update
  Future<int> updateProduk(Produk produk) async {
    Database db = await database;
    return await db.update(Produk.tblProduk, produk.toMap(),
        where: '${Produk.colId}=?', whereArgs: [produk.id]);
  }

//contact - delete
  Future<int> deleteProduk(int id) async {
    Database db = await database;
    return await db
        .delete(Produk.tblProduk, where: '${Produk.colId}=?', whereArgs: [id]);
  }

//contact - retrieve all
  Future<List<Produk>> fetchProduks() async {
    Database db = await database;
    List<Map> produks = await db.query(Produk.tblProduk);
    return produks.length == 0
        ? []
        : produks.map((x) => Produk.fromMap(x)).toList();
  }
}
