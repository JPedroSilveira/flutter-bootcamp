import 'package:flutter/material.dart';
import 'package:todoey/constant/border.dart';
import 'package:todoey/constant/size.dart';
import 'package:todoey/page/task/task_icon.dart';
import 'package:todoey/page/task/task_list.dart';
import 'package:todoey/page/task/title.dart';
import 'package:todoey/repository/task.dart';

import 'add_modal.dart';

class TaskPage extends StatelessWidget {
  final TaskRepository repository = TaskRepository();

  void _handleShowAddModel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddModel(),
      shape: RoundedRectangleBorder(
        borderRadius: KBorder.addModelRadius,
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: KSize.taskPaddingTop,
              left: KSize.taskPaddingLeft,
            ),
            child: TaskIcon(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: KSize.taskTitlePaddingTop,
              bottom: KSize.taskTitlePaddingBottom,
              left: KSize.taskPaddingLeft,
            ),
            child: TaskTitle(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: KSize.taskListPaddingTop,
                left: KSize.taskListPaddingHorizontal,
                right: KSize.taskListPaddingHorizontal,
              ),
              decoration: const BoxDecoration(
                borderRadius: KBorder.taskListRadius,
                color: Colors.white,
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleShowAddModel(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
