import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';
import 'package:flutter_todo_list/data/task.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

var listOfTask = [
  Task(
      id: uuid.v4(),
      title: 'first task',
      color: Colors.red,
      taskPriority: TaskPriority.low),
];
