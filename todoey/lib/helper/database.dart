import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoey/repository/task.dart';

class DatabaseHelper {
  static final String _dbName = 'todoey.db';
  static final int _dbVersion = 1;
  Future<Database?>? _db;

  _onCreate(Database db, int version) async {
    await db.execute(TaskRepository.createQuery);
  }

  Future<Database?> getDb() async {
    _db ??= _openDb();
    return _db;
  }

  Future<Database?> _openDb() async {
    String databasesPath = await getDatabasesPath();
    try {
      await Directory(databasesPath).create(recursive: true);
      return openDatabase(
        _dbName,
        version: _dbVersion,
        onCreate: _onCreate,
      );
    } catch (_) {
      return null;
    }
  }

  static int boolToInt(bool value) {
    return value ? 1 : 0;
  }

  static bool intToBool(int value) {
    return value == 1 ? true : false;
  }

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  factory DatabaseHelper() {
    return _instance;
  }
}
