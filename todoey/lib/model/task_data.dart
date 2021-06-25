import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/entity/task.dart';
import 'package:todoey/repository/task.dart';

class TaskData extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();

  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  TaskData() {
    _loadData();
  }

  void _loadData() async {
    _tasks = await _repository.findAll() ?? [];
    notifyListeners();
  }

  void changeIsDone(int index) async {
    if (_isInvalidIndex(index)) return;

    final Task upTask = Task.copy(_tasks[index]);
    upTask.isDone = !upTask.isDone;
    final bool success = await _repository.update(upTask);
    if (success) {
      _tasks[index] = upTask;
      notifyListeners();
    }
  }

  void add(String name) async {
    final Task newTask = Task(isDone: false, name: name);
    final bool success = await _repository.save(newTask);
    if (success) {
      _tasks.add(newTask);
      notifyListeners();
    }
  }

  void remove(int index) async {
    if (_isInvalidIndex(index)) return;

    final Task task = _tasks[index];

    if (task.id == null) return;

    final bool success = await _repository.remove(task.id!);
    if (success) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }

  bool _isInvalidIndex(int index) {
    return index < 0 && index >= _tasks.length;
  }
}
