import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constant/text_style.dart';
import 'package:todoey/constant/text.dart';
import 'package:todoey/model/task_data.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskData taskData = Provider.of<TaskData>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          KText.appName,
          style: KTextStyle.title,
        ),
        Text(
          '${taskData.tasks.length} Tasks',
          style: KTextStyle.subtitle,
        ),
      ],
    );
  }
}
