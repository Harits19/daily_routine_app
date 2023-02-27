// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_routine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyRoutineModel _$DailyRoutineModelFromJson(Map<String, dynamic> json) {
  return _DailyRoutineModel.fromJson(json);
}

/// @nodoc
mixin _$DailyRoutineModel {
  List<CheckedTaskModel> get checkedTasks => throw _privateConstructorUsedError;
  List<TaskModel> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyRoutineModelCopyWith<DailyRoutineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRoutineModelCopyWith<$Res> {
  factory $DailyRoutineModelCopyWith(
          DailyRoutineModel value, $Res Function(DailyRoutineModel) then) =
      _$DailyRoutineModelCopyWithImpl<$Res, DailyRoutineModel>;
  @useResult
  $Res call({List<CheckedTaskModel> checkedTasks, List<TaskModel> tasks});
}

/// @nodoc
class _$DailyRoutineModelCopyWithImpl<$Res, $Val extends DailyRoutineModel>
    implements $DailyRoutineModelCopyWith<$Res> {
  _$DailyRoutineModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkedTasks = null,
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      checkedTasks: null == checkedTasks
          ? _value.checkedTasks
          : checkedTasks // ignore: cast_nullable_to_non_nullable
              as List<CheckedTaskModel>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyRoutineModelCopyWith<$Res>
    implements $DailyRoutineModelCopyWith<$Res> {
  factory _$$_DailyRoutineModelCopyWith(_$_DailyRoutineModel value,
          $Res Function(_$_DailyRoutineModel) then) =
      __$$_DailyRoutineModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CheckedTaskModel> checkedTasks, List<TaskModel> tasks});
}

/// @nodoc
class __$$_DailyRoutineModelCopyWithImpl<$Res>
    extends _$DailyRoutineModelCopyWithImpl<$Res, _$_DailyRoutineModel>
    implements _$$_DailyRoutineModelCopyWith<$Res> {
  __$$_DailyRoutineModelCopyWithImpl(
      _$_DailyRoutineModel _value, $Res Function(_$_DailyRoutineModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkedTasks = null,
    Object? tasks = null,
  }) {
    return _then(_$_DailyRoutineModel(
      checkedTasks: null == checkedTasks
          ? _value._checkedTasks
          : checkedTasks // ignore: cast_nullable_to_non_nullable
              as List<CheckedTaskModel>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyRoutineModel implements _DailyRoutineModel {
  _$_DailyRoutineModel(
      {required final List<CheckedTaskModel> checkedTasks,
      required final List<TaskModel> tasks})
      : _checkedTasks = checkedTasks,
        _tasks = tasks;

  factory _$_DailyRoutineModel.fromJson(Map<String, dynamic> json) =>
      _$$_DailyRoutineModelFromJson(json);

  final List<CheckedTaskModel> _checkedTasks;
  @override
  List<CheckedTaskModel> get checkedTasks {
    if (_checkedTasks is EqualUnmodifiableListView) return _checkedTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkedTasks);
  }

  final List<TaskModel> _tasks;
  @override
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'DailyRoutineModel(checkedTasks: $checkedTasks, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyRoutineModel &&
            const DeepCollectionEquality()
                .equals(other._checkedTasks, _checkedTasks) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_checkedTasks),
      const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyRoutineModelCopyWith<_$_DailyRoutineModel> get copyWith =>
      __$$_DailyRoutineModelCopyWithImpl<_$_DailyRoutineModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyRoutineModelToJson(
      this,
    );
  }
}

abstract class _DailyRoutineModel implements DailyRoutineModel {
  factory _DailyRoutineModel(
      {required final List<CheckedTaskModel> checkedTasks,
      required final List<TaskModel> tasks}) = _$_DailyRoutineModel;

  factory _DailyRoutineModel.fromJson(Map<String, dynamic> json) =
      _$_DailyRoutineModel.fromJson;

  @override
  List<CheckedTaskModel> get checkedTasks;
  @override
  List<TaskModel> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$_DailyRoutineModelCopyWith<_$_DailyRoutineModel> get copyWith =>
      throw _privateConstructorUsedError;
}
