import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_todo_list/data/controllers/list_notifier.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';
import 'package:flutter_todo_list/data/task.dart';
import 'package:flutter_todo_list/view/edit_task_page.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    super.key,
    required this.task,
    required this.listNotifier,
    this.disableOnTap = false,
  });
  final Task task;
  final ListNotifier listNotifier;
  final bool disableOnTap;
  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    bool checkboxValue = widget.task.isDone;
    return Column(
      children: [
        ColoredBox(
          color:
              !checkboxValue ? widget.task.color ?? Colors.white : Colors.grey,
          child: ListTile(
              leading: Checkbox(
                onChanged: (value) => setState(() {
                  widget.listNotifier.toggleDone(widget.task);
                }),
                value: checkboxValue,
              ),
              title: Text(widget.task.title),
              subtitle: Text(widget.task.subtitle ?? ''),
              trailing: widget.task.taskPriority.icon,
              style: ListTileStyle.list,
              onTap: () => widget.disableOnTap
                  ? null
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditTaskPage(
                            listNotifier: widget.listNotifier,
                            task: widget.task,
                          )))),
        ),
      ],
    );
  }
}
