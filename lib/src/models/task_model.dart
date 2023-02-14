import 'package:daily_routine_app/src/constan/k_enum.dart';
import 'package:daily_routine_app/src/utils/id_util.dart';
import 'package:flutter/material.dart';

class TaskModel {
  String? id;
  String title;
  bool checked;
  DateTime date;
  List<Weekend> listOfDays;

  TaskModel({
    String? id,
    this.checked = false,
    required this.title,
    required this.date,
    List<Weekend>? listOfDays,
  })  : id = id ?? IdUtil.idGenerator(),
        listOfDays = (listOfDays ?? []).toSet().toList();

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json['title'],
        date = DateTime.parse(json['date']),
        // listOfDays = [],
        listOfDays = (json['list_of_days'] as List)
            .map((e) => Weekend.values.byName(e))
            .toList(),
        checked = json['checked'];

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'date': date.toString(),
        'checked': checked,
        'list_of_days': listOfDays.map((e) => e.name).toList()
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
        id: id);
  }
}
