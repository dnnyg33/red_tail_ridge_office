// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_task_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StaffTaskTime {

 int get id; int get staffId; int get taskId; DateTime? get clockIn; DateTime? get clockOut; String? get note;
/// Create a copy of StaffTaskTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffTaskTimeCopyWith<StaffTaskTime> get copyWith => _$StaffTaskTimeCopyWithImpl<StaffTaskTime>(this as StaffTaskTime, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffTaskTime&&(identical(other.id, id) || other.id == id)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,id,staffId,taskId,clockIn,clockOut,note);

@override
String toString() {
  return 'StaffTaskTime(id: $id, staffId: $staffId, taskId: $taskId, clockIn: $clockIn, clockOut: $clockOut, note: $note)';
}


}

/// @nodoc
abstract mixin class $StaffTaskTimeCopyWith<$Res>  {
  factory $StaffTaskTimeCopyWith(StaffTaskTime value, $Res Function(StaffTaskTime) _then) = _$StaffTaskTimeCopyWithImpl;
@useResult
$Res call({
 int id, int staffId, int taskId, DateTime? clockIn, DateTime? clockOut, String? note
});




}
/// @nodoc
class _$StaffTaskTimeCopyWithImpl<$Res>
    implements $StaffTaskTimeCopyWith<$Res> {
  _$StaffTaskTimeCopyWithImpl(this._self, this._then);

  final StaffTaskTime _self;
  final $Res Function(StaffTaskTime) _then;

/// Create a copy of StaffTaskTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? staffId = null,Object? taskId = null,Object? clockIn = freezed,Object? clockOut = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as int,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,clockIn: freezed == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOut: freezed == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as DateTime?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffTaskTime].
extension StaffTaskTimePatterns on StaffTaskTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffTaskTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffTaskTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffTaskTime value)  $default,){
final _that = this;
switch (_that) {
case _StaffTaskTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffTaskTime value)?  $default,){
final _that = this;
switch (_that) {
case _StaffTaskTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int staffId,  int taskId,  DateTime? clockIn,  DateTime? clockOut,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffTaskTime() when $default != null:
return $default(_that.id,_that.staffId,_that.taskId,_that.clockIn,_that.clockOut,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int staffId,  int taskId,  DateTime? clockIn,  DateTime? clockOut,  String? note)  $default,) {final _that = this;
switch (_that) {
case _StaffTaskTime():
return $default(_that.id,_that.staffId,_that.taskId,_that.clockIn,_that.clockOut,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int staffId,  int taskId,  DateTime? clockIn,  DateTime? clockOut,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _StaffTaskTime() when $default != null:
return $default(_that.id,_that.staffId,_that.taskId,_that.clockIn,_that.clockOut,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _StaffTaskTime extends StaffTaskTime {
  const _StaffTaskTime({required this.id, required this.staffId, required this.taskId, this.clockIn, this.clockOut, this.note}): super._();
  

@override final  int id;
@override final  int staffId;
@override final  int taskId;
@override final  DateTime? clockIn;
@override final  DateTime? clockOut;
@override final  String? note;

/// Create a copy of StaffTaskTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffTaskTimeCopyWith<_StaffTaskTime> get copyWith => __$StaffTaskTimeCopyWithImpl<_StaffTaskTime>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffTaskTime&&(identical(other.id, id) || other.id == id)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,id,staffId,taskId,clockIn,clockOut,note);

@override
String toString() {
  return 'StaffTaskTime(id: $id, staffId: $staffId, taskId: $taskId, clockIn: $clockIn, clockOut: $clockOut, note: $note)';
}


}

/// @nodoc
abstract mixin class _$StaffTaskTimeCopyWith<$Res> implements $StaffTaskTimeCopyWith<$Res> {
  factory _$StaffTaskTimeCopyWith(_StaffTaskTime value, $Res Function(_StaffTaskTime) _then) = __$StaffTaskTimeCopyWithImpl;
@override @useResult
$Res call({
 int id, int staffId, int taskId, DateTime? clockIn, DateTime? clockOut, String? note
});




}
/// @nodoc
class __$StaffTaskTimeCopyWithImpl<$Res>
    implements _$StaffTaskTimeCopyWith<$Res> {
  __$StaffTaskTimeCopyWithImpl(this._self, this._then);

  final _StaffTaskTime _self;
  final $Res Function(_StaffTaskTime) _then;

/// Create a copy of StaffTaskTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? staffId = null,Object? taskId = null,Object? clockIn = freezed,Object? clockOut = freezed,Object? note = freezed,}) {
  return _then(_StaffTaskTime(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as int,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as int,clockIn: freezed == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOut: freezed == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as DateTime?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
