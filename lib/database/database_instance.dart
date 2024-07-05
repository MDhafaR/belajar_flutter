import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _dbName = "my_dbf.db";
  final int _dbVersion = 1;

  // table product
  final String tableName = "product";
  // column table product
  final String id = "id";
  final String name = "name";
  final String category = "category";
  final String createdAt = "created_at";
  final String updatedAt = "updated_at";

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _dbName);
    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $name TEXT, $category TEXT, $createdAt TEXT, $updatedAt TEXT)');
      },
    );
  }
}
