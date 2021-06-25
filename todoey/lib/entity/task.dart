import 'package:todoey/helper/database.dart';

class Task {
  static final String tableName = 'task';

  static final String idField = 'id';
  int? id;

  static final String nameField = 'name';
  final String name;

  static final String isDoneField = 'is_done';
  bool isDone;

  Task({
    this.id,
    required this.name,
    required this.isDone,
  });

  factory Task.fromDb(Map<String, Object?> e) {
    return Task(
      isDone: DatabaseHelper.intToBool(e[isDoneField] as int),
      name: e[nameField] as String,
      id: e[idField] as int,
    );
  }

  factory Task.copy(Task task) {
    return Task(
      isDone: task.isDone,
      name: task.name,
      id: task.id,
    );
  }

  factory Task.undone(Task task) {
    return Task(
      isDone: false,
      name: task.name,
      id: task.id,
    );
  }

  Map<String, Object?> toDb() {
    return {
      Task.nameField: name,
      Task.isDoneField: DatabaseHelper.boolToInt(isDone),
      if (id != null) Task.idField: id,
    };
  }
}
