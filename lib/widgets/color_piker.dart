import 'package:flutter/material.dart';
import 'package:flutter_todo_list/data/task.dart';
import 'package:flutter_todo_list/utils/colors.dart';
import 'package:flutter_todo_list/utils/extensions.dart';
import 'package:flutter_todo_list/widgets/color_piker_item.dart';

class ColorPiker extends StatefulWidget {
  const ColorPiker({super.key, required this.colorNotifier, this.task});

  final ValueNotifier<Color> colorNotifier;
  final Task? task;
  @override
  State<ColorPiker> createState() => _ColorPikerState();
}

class _ColorPikerState extends State<ColorPiker> {
  @override
  void initState() {
    super.initState();
    final color = widget.task?.color;
    if (color != null) {
      colors.toggleColor(color);
    } else {
      colors.setAllFalse();
    }
    widget.colorNotifier.value = color ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // children:
      children: [
        for (var i in colors.entries)
          GestureDetector(
              onTap: () {
                setState(() {
                  colors.updateAll((key, value) {
                    if (key != i.key) {
                      return value = false;
                    }
                    widget.colorNotifier.value = key;
                    return value = true;
                  });
                });
              },
              child: ColorPikerItem(color: i.key, isChecked: i.value))
      ],
    );
  }
}
