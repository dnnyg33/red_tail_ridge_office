// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StaffTask {

 int get taskId; int get staffId; int get propertyId; String get taskName; DateTime? get taskDate;/// Time spent on the task, parsed from the API's `HH:MM:SS` `TimeTracked`
/// string. Null when not tracked. Compared against the unit's
/// `maxCleanTime` to decide whether a checkout clean counts for the bonus.
 Duration? get timeTracked;
/// Create a copy of StaffTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffTaskCopyWith<StaffTask> get copyWith => _$StaffTaskCopyWithImpl<StaffTask>(this as StaffTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.taskName, taskName) || other.taskName == taskName)&&(identical(other.taskDate, taskDate) || other.taskDate == taskDate)&&(identical(other.timeTracked, timeTracked) || other.timeTracked == timeTracked));
}


@override
int get hashCode => Object.hash(runtimeType,taskId,staffId,propertyId,taskName,taskDate,timeTracked);

@override
String toString() {
  return 'StaffTask(taskId: $taskId, staffId: $staffId, propertyId: $propertyId, taskName: $taskName, taskDate: $taskDate, timeTracked: $timeTracked)';
}


}

/// @nodoc
abstract mixin class $StaffTaskCopyWith<$Res>  {
  factory $StaffTaskCopyWith(StaffTask value, $Res Function(StaffTask) _then) = _$StaffTaskCopyWithImpl;
@useResult
$Res call({
 int taskId, int staffId, int propertyId, String taskName, DateTime? taskDate, Duration? timeTracked
});




}
/// @nodoc
class _$StaffTaskCopyWithImpl<$Res>
    implements $StaffTaskCopyWith<$Res> {
  _$StaffTaskCopyWithImpl(this._self, this._then);

  final StaffTask _self;
  final $Res Function(StaffTask) _then;

/// Create a copy of StaffTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? staffId = null,Object? propertyId = null,Object? taskName = null,Object? taskDate = freezed,Object? timeTracked = freezed,}) {
  return _then(_self.copyWith(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as int,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int,taskName: null == taskName ? _self.taskName : taskName // ignore: cast_nullable_to_non_nullable
as String,taskDate: freezed == taskDate ? _self.taskDate : taskDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timeTracked: freezed == timeTracked ? _self.timeTracked : timeTracked // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffTask].
extension StaffTaskPatterns on StaffTask {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffTask() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffTask value)  $default,){
final _that = this;
switch (_that) {
case _StaffTask():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffTask value)?  $default,){
final _that = this;
switch (_that) {
case _StaffTask() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int taskId,  int staffId,  int propertyId,  String taskName,  DateTime? taskDate,  Duration? timeTracked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffTask() when $default != null:
return $default(_that.taskId,_that.staffId,_that.propertyId,_that.taskName,_that.taskDate,_that.timeTracked);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int taskId,  int staffId,  int propertyId,  String taskName,  DateTime? taskDate,  Duration? timeTracked)  $default,) {final _that = this;
switch (_that) {
case _StaffTask():
return $default(_that.taskId,_that.staffId,_that.propertyId,_that.taskName,_that.taskDate,_that.timeTracked);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int taskId,  int staffId,  int propertyId,  String taskName,  DateTime? taskDate,  Duration? timeTracked)?  $default,) {final _that = this;
switch (_that) {
case _StaffTask() when $default != null:
return $default(_that.taskId,_that.staffId,_that.propertyId,_that.taskName,_that.taskDate,_that.timeTracked);case _:
  return null;

}
}

}

/// @nodoc


class _StaffTask extends StaffTask {
  const _StaffTask({required this.taskId, required this.staffId, required this.propertyId, this.taskName = '', this.taskDate, this.timeTracked}): super._();
  

@override final  int taskId;
@override final  int staffId;
@override final  int propertyId;
@override@JsonKey() final  String taskName;
@override final  DateTime? taskDate;
/// Time spent on the task, parsed from the API's `HH:MM:SS` `TimeTracked`
/// string. Null when not tracked. Compared against the unit's
/// `maxCleanTime` to decide whether a checkout clean counts for the bonus.
@override final  Duration? timeTracked;

/// Create a copy of StaffTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffTaskCopyWith<_StaffTask> get copyWith => __$StaffTaskCopyWithImpl<_StaffTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.propertyId, propertyId) || other.propertyId == propertyId)&&(identical(other.taskName, taskName) || other.taskName == taskName)&&(identical(other.taskDate, taskDate) || other.taskDate == taskDate)&&(identical(other.timeTracked, timeTracked) || other.timeTracked == timeTracked));
}


@override
int get hashCode => Object.hash(runtimeType,taskId,staffId,propertyId,taskName,taskDate,timeTracked);

@override
String toString() {
  return 'StaffTask(taskId: $taskId, staffId: $staffId, propertyId: $propertyId, taskName: $taskName, taskDate: $taskDate, timeTracked: $timeTracked)';
}


}

/// @nodoc
abstract mixin class _$StaffTaskCopyWith<$Res> implements $StaffTaskCopyWith<$Res> {
  factory _$StaffTaskCopyWith(_StaffTask value, $Res Function(_StaffTask) _then) = __$StaffTaskCopyWithImpl;
@override @useResult
$Res call({
 int taskId, int staffId, int propertyId, String taskName, DateTime? taskDate, Duration? timeTracked
});




}
/// @nodoc
class __$StaffTaskCopyWithImpl<$Res>
    implements _$StaffTaskCopyWith<$Res> {
  __$StaffTaskCopyWithImpl(this._self, this._then);

  final _StaffTask _self;
  final $Res Function(_StaffTask) _then;

/// Create a copy of StaffTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? staffId = null,Object? propertyId = null,Object? taskName = null,Object? taskDate = freezed,Object? timeTracked = freezed,}) {
  return _then(_StaffTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as int,propertyId: null == propertyId ? _self.propertyId : propertyId // ignore: cast_nullable_to_non_nullable
as int,taskName: null == taskName ? _self.taskName : taskName // ignore: cast_nullable_to_non_nullable
as String,taskDate: freezed == taskDate ? _self.taskDate : taskDate // ignore: cast_nullable_to_non_nullable
as DateTime?,timeTracked: freezed == timeTracked ? _self.timeTracked : timeTracked // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}


}

// dart format on
