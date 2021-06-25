import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constant/size.dart';
import 'package:todoey/entity/task.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/page/task/item.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskData taskData = Provider.of<TaskData>(context);
    final UnmodifiableListView<Task> tasks = taskData.tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        final TaskItem taskItem = TaskItem(
          task: tasks[index],
          onChange: () => taskData.changeIsDone(index),
          onDelete: () => taskData.remove(index),
        );

        if (index == tasks.length - 1) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: KSize.taskItemBottomPadding,
            ),
            child: taskItem,
          );
        }
        return taskItem;
      },
    );
  }
}
