// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_todo_list/data/models/task_priority.dart';

class Task {
  const Task({
    required this.id,
    this.color,
    required this.title,
    this.subtitle,
    required this.taskPriority,
    this.isDone = false,
  });
  final String id;
  final Color? color;
  final bool isDone;
  final String title;
  final String? subtitle;
  final TaskPriority taskPriority;

  Task copyWith({
    String? id,
    Color? color,
    String? title,
    String? subtitle,
    TaskPriority? taskPriority,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      color: color ?? this.color,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      taskPriority: taskPriority ?? this.taskPriority,
      isDone: isDone ?? this.isDone,
    );
  }
}
