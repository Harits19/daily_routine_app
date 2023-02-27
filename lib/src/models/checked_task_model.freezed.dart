// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checked_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckedTaskModel _$CheckedTaskModelFromJson(Map<String, dynamic> json) {
  return _CheckedTaskModel.fromJson(json);
}

/// @nodoc
mixin _$CheckedTaskModel {
  DateTime get date => throw _privateConstructorUsedError;
  String get idTask => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckedTaskModelCopyWith<CheckedTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckedTaskModelCopyWith<$Res> {
  factory $CheckedTaskModelCopyWith(
          CheckedTaskModel value, $Res Function(CheckedTaskModel) then) =
      _$CheckedTaskModelCopyWithImpl<$Res, CheckedTaskModel>;
  @useResult
  $Res call({DateTime date, String idTask});
}

/// @nodoc
class _$CheckedTaskModelCopyWithImpl<$Res, $Val extends CheckedTaskModel>
    implements $CheckedTaskModelCopyWith<$Res> {
  _$CheckedTaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? idTask = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      idTask: null == idTask
          ? _value.idTask
          : idTask // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckedTaskModelCopyWith<$Res>
    implements $CheckedTaskModelCopyWith<$Res> {
  factory _$$_CheckedTaskModelCopyWith(
          _$_CheckedTaskModel value, $Res Function(_$_CheckedTaskModel) then) =
      __$$_CheckedTaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, String idTask});
}

/// @nodoc
class __$$_CheckedTaskModelCopyWithImpl<$Res>
    extends _$CheckedTaskModelCopyWithImpl<$Res, _$_CheckedTaskModel>
    implements _$$_CheckedTaskModelCopyWith<$Res> {
  __$$_CheckedTaskModelCopyWithImpl(
      _$_CheckedTaskModel _value, $Res Function(_$_CheckedTaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? idTask = null,
  }) {
    return _then(_$_CheckedTaskModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      idTask: null == idTask
          ? _value.idTask
          : idTask // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckedTaskModel implements _CheckedTaskModel {
  const _$_CheckedTaskModel({required this.date, required this.idTask});

  factory _$_CheckedTaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_CheckedTaskModelFromJson(json);

  @override
  final DateTime date;
  @override
  final String idTask;

  @override
  String toString() {
    return 'CheckedTaskModel(date: $date, idTask: $idTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckedTaskModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.idTask, idTask) || other.idTask == idTask));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, idTask);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckedTaskModelCopyWith<_$_CheckedTaskModel> get copyWith =>
      __$$_CheckedTaskModelCopyWithImpl<_$_CheckedTaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckedTaskModelToJson(
      this,
    );
  }
}

abstract class _CheckedTaskModel implements CheckedTaskModel {
  const factory _CheckedTaskModel(
      {required final DateTime date,
      required final String idTask}) = _$_CheckedTaskModel;

  factory _CheckedTaskModel.fromJson(Map<String, dynamic> json) =
      _$_CheckedTaskModel.fromJson;

  @override
  DateTime get date;
  @override
  String get idTask;
  @override
  @JsonKey(ignore: true)
  _$$_CheckedTaskModelCopyWith<_$_CheckedTaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
