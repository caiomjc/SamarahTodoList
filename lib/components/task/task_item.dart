import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final void Function(Task, bool) onChanged;
  final void Function(BuildContext, Task, int) onDismissed;

  const TaskItem(
    this.task,
    this.index,
    this.onChanged,
    this.onDismissed,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text(
          task.description,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(task.date),
          style: Theme.of(context).textTheme.subtitle2,
        ),
        value: task.finished,
        secondary: CircleAvatar(
          backgroundColor: Colors.amber,
          child: Icon(
            task.finished ? Icons.check : Icons.error,
            color: Colors.black,
          ),
        ),
        onChanged: (check) => onChanged(task, check),
      ),
      onDismissed: (direction) => onDismissed(context, task, index),
    );
  }
}
