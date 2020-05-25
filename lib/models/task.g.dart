// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    description: json['description'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  )
    ..finished = json['finished'] as bool
    ..id = json['id'] as String;
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'description': instance.description,
      'date': instance.date?.toIso8601String(),
      'finished': instance.finished,
      'id': instance.id,
    };
