import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constant/size.dart';
import 'package:todoey/constant/text.dart';
import 'package:todoey/constant/text_style.dart';
import 'package:todoey/model/task_data.dart';

class AddModel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddModelState();
  }
}

class AddModelState extends State<AddModel> {
  late final TextEditingController _nameController;

  _handleAddTask(BuildContext context) {
    final TaskData taskData = Provider.of<TaskData>(
      context,
      listen: false,
    );

    taskData.add(_nameController.text);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            KSize.addTaskModelPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                KText.addTaskTitle,
                textAlign: TextAlign.center,
                style: KTextStyle.addTaskTitle,
              ),
              SizedBox(
                height: KSize.addTaskModelSpaceBetween,
              ),
              TextField(
                autofocus: true,
                style: KTextStyle.addTaskInput,
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor: Colors.lightBlueAccent,
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(
                height: KSize.addTaskModelSpaceBetween,
              ),
              TextButton(
                onPressed: () => _handleAddTask(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: Text(
                  KText.addTaskButton,
                  style: KTextStyle.addTaskButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
