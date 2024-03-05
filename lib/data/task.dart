import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';

class Task {
  const Task({
    required this.title,
    required this.taskPriority,
    this.subtitle,
    this.color,
  });
  final Color? color;
  final String title;
  final String? subtitle;
  final TaskPriority taskPriority;
}
