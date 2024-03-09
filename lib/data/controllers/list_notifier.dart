import 'package:flutter/material.dart';

import 'package:flutter_todo_list/data/task.dart';

class ListNotifier extends ValueNotifier<List<Task>> {
  ListNotifier(super.value);

  List<Task> listOfDownTask = [];
  void addTask(Task task) {
    value = [...value..add(task)];
    notifyListeners();
  }

  void updateTask(String id, Task task) {
    final index = value.indexWhere((element) => element.id == id);
    value = [
      ...value
        ..removeAt(index)
        ..insert(index, task)
    ];
    notifyListeners();
  }

  void removeTask(Task task) {
    value = [...value..remove(task)];
    notifyListeners();
  }

  void toggleDone(Task task) {
    final isDone = task.isDone;
    if (!isDone) {
      value = [...value..remove(task)];
      listOfDownTask = [...listOfDownTask..add(task.copyWith(isDone: true))];
    } else {
      value = [...value..add(task.copyWith(isDone: false))];
      listOfDownTask = [...listOfDownTask..remove(task)];
    }
    notifyListeners();
  }
}
