import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';
import 'package:flutter_todo_list/data/task.dart';

var listOfTask = [
  const Task(
      title: 'first task', color: Colors.red, taskPriority: TaskPriority.low),
  const Task(
    title: 'second task',
    color: Colors.blue,
    taskPriority: TaskPriority.medium,
  ),
  const Task(
      title: 'third task',
      color: Colors.limeAccent,
      taskPriority: TaskPriority.high),
  const Task(
      title: 'fourth task',
      color: Colors.green,
      taskPriority: TaskPriority.low),
];
