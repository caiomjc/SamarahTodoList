import 'dart:convert';

import '../models/task.dart';

class TaskModelJsonConverter {
  List<Task> toModel(String json) {
    var tasksList = List<Task>();
    
    var tasks = jsonDecode(json);
    tasks.forEach((task) => tasksList.add(Task.fromJson(task)));

    return tasksList;
  }

  String toJson(List<Task> tasks) {
    return jsonEncode(tasks);
  }
}
