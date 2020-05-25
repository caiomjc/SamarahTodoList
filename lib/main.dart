import 'package:flutter/material.dart';

import 'components/home.dart';
import 'helpers/task_model_json_converter.dart';
import 'repository/repository.dart';

import 'theme/theme.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(
        repository: Repository(),
        modelJsonConverter: TaskModelJsonConverter(),
      ),
      theme: basicTheme(),
    ),
  );
}
