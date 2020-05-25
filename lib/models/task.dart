import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()

class Task {
  String _id;
  final String description;
  final DateTime date;
  bool finished;

  Task({
    @required this.description,
    @required this.date,
  }) {
    _id = Random().nextDouble().toString();
    finished = false;
  }

  String get id => _id;

  set id(String id) {
    this._id = id;
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
