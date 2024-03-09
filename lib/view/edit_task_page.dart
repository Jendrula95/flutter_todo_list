import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_todo_list/data/controllers/list_notifier.dart';
import 'package:flutter_todo_list/data/list_of_tasks.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';
import 'package:flutter_todo_list/data/task.dart';
import 'package:flutter_todo_list/utils/colors.dart';
import 'package:flutter_todo_list/view/title_textField.dart';
import 'package:uuid/uuid.dart';

import '../widgets/color_piker.dart';
import '../widgets/dropdown_priority_piker.dart';

class EditTaskPage extends StatelessWidget {
  EditTaskPage({super.key, required this.listNotifier, this.task});

  final Task? task;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final ListNotifier listNotifier;
  final ValueNotifier<Color> colorNotifier = ValueNotifier(Colors.white);
  final ValueNotifier<TaskPriority> priorityNotifier =
      ValueNotifier(TaskPriority.high);
  final ValueNotifier<String?> errorTextFieldNotifier = ValueNotifier(null);
  String? errorText;

  TextEditingController setTitleController(Task? task) {
    if (task == null) return titleController;
    titleController.text = task.title;
    return titleController;
  }

  TextEditingController setDescController(Task? task) {
    if (task == null) return descController;
    descController.text = task.title;
    return descController;
  }

  ValueNotifier<TaskPriority> setPriorityNotifier(Task? task) {
    if (task == null) return priorityNotifier;
    priorityNotifier.value = task.taskPriority;
    return priorityNotifier;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const Text('Task Name'),
          const SizedBox(
            height: 10,
          ),
          TitleTextField(
            setController: setTitleController(task),
            errorTextNotifier: errorTextFieldNotifier,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Task Description'),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: setDescController(task),
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: 14,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue))),
          ),
          const SizedBox(
            height: 10,
          ),
          ColorPiker(
            colorNotifier: colorNotifier,
            task: task,
          ),
          const SizedBox(
            height: 10,
          ),
          DropDownPriorityPicker(
            priorityNotifier: setPriorityNotifier(task),
            initialDropdownValue: task?.taskPriority,
          ),
          const SizedBox(
            height: 10,
          ),
          if (task == null)
            MaterialButton(
              onPressed: () {
                if (titleController.text.isEmpty) {
                  errorText = "Please enter a title";
                  errorTextFieldNotifier.value = errorText ?? "";
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'At least the title of the task must be indicated!')));
                  return;
                }
                listNotifier.addTask(Task(
                  id: const Uuid().v4(),
                  color: colorNotifier.value,
                  title: titleController.text,
                  subtitle: descController.text,
                  taskPriority: priorityNotifier.value,
                ));
                Navigator.of(context).pop();
              },
              color: Colors.red,
              child: const Text('Add Task'),
              textColor: Colors.white,
            ),
          if (task != null)
            MaterialButton(
              onPressed: () {
                listNotifier.updateTask(
                  task!.id,
                  task!.copyWith(
                      color: colorNotifier.value,
                      title: titleController.text,
                      subtitle: descController.text,
                      taskPriority: priorityNotifier.value),
                );
                Navigator.of(context).pop();
              },
              color: Colors.red,
              child: const Text('update Task'),
              textColor: Colors.white,
            )
        ],
      )),
    );
  }
}
