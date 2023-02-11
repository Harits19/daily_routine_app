import 'package:daily_routine_app/src/models/time_of_day_model.dart';
import 'package:daily_routine_app/src/utils/id_util.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String? id;
  String title;
  TimeOfDay time;

  TaskModel({
    required this.time,
    required this.title,
  }) : id = IdUtil.idGenerator();

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json['title'],
        time = timeOfDayFromJson(json['time']);

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'time': time.toJson(),
      };
}
