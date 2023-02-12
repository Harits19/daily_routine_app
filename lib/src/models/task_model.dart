import 'package:daily_routine_app/src/models/time_of_day_model.dart';
import 'package:daily_routine_app/src/utils/id_util.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String? id;
  String title;
  TimeOfDay time;
  bool checked;

  TaskModel({
    String? id,
    this.checked = false,
    required this.time,
    required this.title,
  }) : id = id ?? IdUtil.idGenerator();

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json['title'],
        time = timeOfDayFromJson(json['time']),
        checked = json['checked'];

  Map<String, dynamic> toJson() =>
      {"id": id, 'title': title, 'time': time.toJson(), 'checked': checked};

  TaskModel copyWith({
    String? title,
    TimeOfDay? time,
    bool? checked,
    String? id,
  }) {
    return TaskModel(
        time: time ?? this.time,
        title: title ?? this.title,
        checked: checked ?? this.checked,
        id: id ?? this.id);
  }
}
