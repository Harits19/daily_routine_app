import 'package:daily_routine_app/src/enums/weekend.dart';
import 'package:daily_routine_app/src/utils/id_util.dart';
import 'package:daily_routine_app/src/extensions/time_of_day_extension.dart';
import 'package:flutter/material.dart';

class TaskModel {
  final String id;
  final String title;
  final DateTime? date;
  final List<Weekend> listOfDays;
  final TimeOfDay time;
  final bool isDeleted;

  TaskModel({
    required this.time,
    required this.title,
    this.isDeleted = false,
    this.date,
    String? id,
    List<Weekend>? listOfDays,
  })  : id = id ?? IdUtil.idGenerator(),
        listOfDays = (listOfDays ?? []).toSet().toList();

  TaskModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json['title'],
        date = DateTime.tryParse(json['date']),
        listOfDays = (json['list_of_days'] as List)
            .map((e) => Weekend.values.byName(e))
            .toList(),
        time = TimeOfDay(
          hour: json['time']['hour'],
          minute: json['time']['minute'],
        ),
        isDeleted = json["is_deleted"] ?? false;

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'date': date.toString(),
        'list_of_days': listOfDays.map((e) => e.name).toList(),
        'time': time.toJson(),
        'is_deleted': isDeleted,
      };

  TaskModel copyWith({
    bool? isDeleted,
  }) {
    return TaskModel(
      title: title,
      date: date,
      time: time,
      listOfDays: listOfDays,
      id: id,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  bool get isSingle {
    return date != null;
  }

  bool get isRecurring {
    return !isSingle;
  }
}
