import 'package:sqflite/sqlite_api.dart';
import 'package:todoey/helper/database.dart';
import 'package:todoey/entity/task.dart';

class TaskRepository {
  static final String createQuery = 'CREATE TABLE ${Task.tableName} (' +
      '${Task.idField} INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      '${Task.nameField} TEXT, ' +
      '${Task.isDoneField} INTEGER)';

  Future<bool> save(Task task) async {
    Database? db = await DatabaseHelper().getDb();
    if (db == null) return false;
    if (task.id != null) return false;

    try {
      final int? id = await db.insert(
        Task.tableName,
        task.toDb(),
      );

      if (_isValidId(id)) {
        task.id = id;
        return true;
      }
    } catch (e) {}
    return false;
  }

  Future<bool> update(Task task) async {
    Database? db = await DatabaseHelper().getDb();
    if (db == null) return false;
    if (task.id == null) return false;

    try {
      final int updatedRows = await db.update(
        Task.tableName,
        task.toDb(),
        where: '${Task.idField} = ?',
        whereArgs: [task.id],
      );
      return updatedRows > 0;
    } catch (e) {
      return false;
    }
  }

  Future<bool> remove(int id) async {
    Database? db = await DatabaseHelper().getDb();
    if (db == null) return false;
    if (_isInvalidId(id)) return false;

    try {
      final int updatedRows = await db.delete(
        Task.tableName,
        where: '${Task.idField} = ?',
        whereArgs: [id],
      );
      return updatedRows > 0;
    } catch (e) {
      return false;
    }
  }

  Future<List<Task>?> findAll() async {
    Database? db = await DatabaseHelper().getDb();
    if (db == null) return null;

    var list = await db.query(
      Task.tableName,
      columns: [Task.idField, Task.nameField, Task.isDoneField],
    );

    return list.map((e) => Task.fromDb(e)).toList();
  }

  bool _isValidId(int? id) {
    return id != null && id != 0;
  }

  bool _isInvalidId(int? id) {
    return !_isValidId(id);
  }

  static final TaskRepository _instance = TaskRepository._internal();
  TaskRepository._internal();
  factory TaskRepository() {
    return _instance;
  }
}
