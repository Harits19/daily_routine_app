import 'package:daily_routine_app/src/enums/weekend.dart';
import 'package:daily_routine_app/src/utils/id_util.dart';
import 'package:daily_routine_app/src/extensions/time_of_day_extension.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String? id;
  String title;
  bool checked;
  DateTime? date;
  List<Weekend> listOfDays;
  TimeOfDay time;

  TaskModel({
    required this.time,
    required this.title,
    this.checked = false,
    this.date,
    String? id,
    List<Weekend>? listOfDays,
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
        time = TimeOfDay(
          hour: json['time']['hour'],
          minute: json['time']['minute'],
        );

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'date': date.toString(),
        'checked': checked,
        'list_of_days': listOfDays.map((e) => e.name).toList(),
        'time': time.toJson(),
      };

  TaskModel copyWith({
    bool? checked,
  }) {
    return TaskModel(
        title: title,
        checked: checked ?? this.checked,
        date: date,
        time: time,
        listOfDays: listOfDays,
        id: id);
  }
}
