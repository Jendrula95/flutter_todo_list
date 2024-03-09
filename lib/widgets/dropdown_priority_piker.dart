import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/models/task_priority.dart';

class DropDownPriorityPicker extends StatefulWidget {
  DropDownPriorityPicker({
    super.key,
    required this.priorityNotifier,
    this.initialDropdownValue,
  });

  final ValueNotifier priorityNotifier;
  TaskPriority? initialDropdownValue;

  @override
  State<DropDownPriorityPicker> createState() => _DropDownPriorityPickerState();
}

class _DropDownPriorityPickerState extends State<DropDownPriorityPicker> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) {
        if (value == null) return;
        widget.initialDropdownValue = value;
        setState(() {
          widget.initialDropdownValue = value as TaskPriority;
          widget.priorityNotifier.value =
              widget.initialDropdownValue ?? TaskPriority.high;
        });
      },
      value: widget.initialDropdownValue ?? TaskPriority.high,
      items: TaskPriority.values
          .map((element) => DropdownMenuItem(
              value: element,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(element.text),
                  const SizedBox(
                    width: 4,
                  ),
                  element.icon
                ]),
              )))
          .toList(),
    );
  }
}
