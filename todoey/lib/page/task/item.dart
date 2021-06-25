import 'package:flutter/material.dart';
import 'package:todoey/constant/text_style.dart';
import 'package:todoey/entity/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final void Function() onChange;
  final void Function() onDelete;

  TaskItem({
    Key? key,
    required this.task,
    required this.onChange,
    required this.onDelete,
  }) : super(key: key);

  Color _getCheckboxColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return Colors.blueAccent;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          task.name,
          style: task.isDone ? KTextStyle.checkedTask : KTextStyle.task,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(_getCheckboxColor),
              value: task.isDone,
              onChanged: (value) => onChange(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
              ),
              onPressed: onDelete,
              child: Icon(
                Icons.delete,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
