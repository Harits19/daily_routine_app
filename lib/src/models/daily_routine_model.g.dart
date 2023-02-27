// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_routine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyRoutineModel _$$_DailyRoutineModelFromJson(Map<String, dynamic> json) =>
    _$_DailyRoutineModel(
      checkedTasks: (json['checkedTasks'] as List<dynamic>)
          .map((e) => CheckedTaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: json['tasks'] as List<dynamic>,
    );

Map<String, dynamic> _$$_DailyRoutineModelToJson(
        _$_DailyRoutineModel instance) =>
    <String, dynamic>{
      'checkedTasks': instance.checkedTasks,
      'tasks': instance.tasks,
    };
