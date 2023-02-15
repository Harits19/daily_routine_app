import 'package:daily_routine_app/src/enums/weekend.dart';
import 'package:daily_routine_app/src/utils/id_util.dart';
import 'package:daily_routine_app/src/utils/time_of_day_util.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String? id;
  String title;
  bool checked;
  DateTime? date;
  List<Weekend> listOfDays;
  TimeOfDay time;

  TaskModel({
    String? id,
    this.checked = false,
    required this.title,
    this.date,
    List<Weekend>? listOfDays,
    required this.time,
  })  : id = id ?? IdUtil.idGenerator(),
        listOfDays = (listOfDays ?? []).toSet().toList();

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json['title'],
        date = DateTime.tryParse(json['date']),
        // listOfDays = [],
        listOfDays = (json['list_of_days'] as List)
            .map((e) => Weekend.values.byName(e))
            .toList(),
        checked = json['checked'],
        time = timeOfDayFromJson(json['time']);

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'date': date.toString(),
        'checked': checked,
        'list_of_days': listOfDays.map((e) => e.name).toList(),
        'time': time.toJson(),
      };

  TaskModel copyWith({
    String? title,
    TimeOfDay? time,
    bool? checked,
    DateTime? date,
  }) {
    return TaskModel(
        title: title ?? this.title,
        checked: checked ?? this.checked,
        date: date ?? this.date,
        time: time ?? this.time,
        id: id);
  }
}
