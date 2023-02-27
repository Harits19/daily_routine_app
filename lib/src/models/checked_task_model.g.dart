// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checked_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckedTaskModel _$$_CheckedTaskModelFromJson(Map<String, dynamic> json) =>
    _$_CheckedTaskModel(
      date: DateTime.parse(json['date'] as String),
      idTask: json['idTask'] as String,
    );

Map<String, dynamic> _$$_CheckedTaskModelToJson(_$_CheckedTaskModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'idTask': instance.idTask,
    };
