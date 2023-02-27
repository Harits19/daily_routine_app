import 'package:daily_routine_app/src/models/checked_task_model.dart';
import 'package:daily_routine_app/src/models/task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_routine_model.freezed.dart';
part 'daily_routine_model.g.dart';

@freezed
class DailyRoutineModel with _$DailyRoutineModel {
  factory DailyRoutineModel({
    required List<CheckedTaskModel> checkedTasks,
    required List<TaskModel> tasks,
  }) = _DailyRoutineModel;

  factory DailyRoutineModel.fromJson(Map<String, dynamic> json) =>
      _$DailyRoutineModelFromJson(json);
}
