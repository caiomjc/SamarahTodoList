import 'package:flutter/material.dart';
import './task_item.dart';
import '../../models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> _tasksList;
  final void Function(Task, bool) onChanged;
  final void Function(BuildContext, Task, int) onDismissed;

  TaskList(this._tasksList, this.onChanged, this.onDismissed);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: _tasksList.length,
      itemBuilder: (context, index) {
        final task = _tasksList[index];
        return TaskItem(
          task,
          index,
          onChanged,
          onDismissed,
        );
      },
    );
  }
}
