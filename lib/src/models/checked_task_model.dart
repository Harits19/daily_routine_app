import 'package:daily_routine_app/src/extensions/date_time_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checked_task_model.freezed.dart';
part 'checked_task_model.g.dart';

@freezed
class CheckedTaskModel with _$CheckedTaskModel {

  const factory CheckedTaskModel({
    required DateTime date,
    required String idTask,
  }) = _CheckedTaskModel;

  factory CheckedTaskModel.fromJson(Map<String, Object?> json) =>
      _$CheckedTaskModelFromJson(json);
}

extension CheckedTaskModelExtension on CheckedTaskModel {
  bool isSameWith(CheckedTaskModel other) {
    return idTask == other.idTask && date.isSameDate(other.date);
  }
}
