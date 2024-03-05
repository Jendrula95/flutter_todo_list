import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';
import 'package:flutter_todo_list/data/task.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    super.key,
    required this.task,
  });
  final Task task;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.task.color ?? Colors.white,
      child: ListTile(
        leading: Checkbox(
          onChanged: (value) => setState(() {
            checkboxValue = value ?? false;
          }),
          value: checkboxValue,
        ),
        title: Text(widget.task.title),
        subtitle: Text(widget.task.subtitle ?? ''),
        trailing: widget.task.taskPriority.icon,
        style: ListTileStyle.list,
      ),
    );
  }
}
