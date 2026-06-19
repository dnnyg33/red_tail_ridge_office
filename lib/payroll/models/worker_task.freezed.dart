// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerTask {

 String get date; String get start; String get end; int get minutes; String get property;
/// Create a copy of WorkerTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerTaskCopyWith<WorkerTask> get copyWith => _$WorkerTaskCopyWithImpl<WorkerTask>(this as WorkerTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerTask&&(identical(other.date, date) || other.date == date)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.property, property) || other.property == property));
}


@override
int get hashCode => Object.hash(runtimeType,date,start,end,minutes,property);

@override
String toString() {
  return 'WorkerTask(date: $date, start: $start, end: $end, minutes: $minutes, property: $property)';
}


}

/// @nodoc
abstract mixin class $WorkerTaskCopyWith<$Res>  {
  factory $WorkerTaskCopyWith(WorkerTask value, $Res Function(WorkerTask) _then) = _$WorkerTaskCopyWithImpl;
@useResult
$Res call({
 String date, String start, String end, int minutes, String property
});




}
/// @nodoc
class _$WorkerTaskCopyWithImpl<$Res>
    implements $WorkerTaskCopyWith<$Res> {
  _$WorkerTaskCopyWithImpl(this._self, this._then);

  final WorkerTask _self;
  final $Res Function(WorkerTask) _then;

/// Create a copy of WorkerTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? start = null,Object? end = null,Object? minutes = null,Object? property = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,property: null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerTask].
extension WorkerTaskPatterns on WorkerTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerTask value)  $default,){
final _that = this;
switch (_that) {
case _WorkerTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerTask value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String start,  String end,  int minutes,  String property)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerTask() when $default != null:
return $default(_that.date,_that.start,_that.end,_that.minutes,_that.property);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String start,  String end,  int minutes,  String property)  $default,) {final _that = this;
switch (_that) {
case _WorkerTask():
return $default(_that.date,_that.start,_that.end,_that.minutes,_that.property);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String start,  String end,  int minutes,  String property)?  $default,) {final _that = this;
switch (_that) {
case _WorkerTask() when $default != null:
return $default(_that.date,_that.start,_that.end,_that.minutes,_that.property);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerTask implements WorkerTask {
  const _WorkerTask({required this.date, required this.start, required this.end, required this.minutes, required this.property});
  

@override final  String date;
@override final  String start;
@override final  String end;
@override final  int minutes;
@override final  String property;

/// Create a copy of WorkerTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerTaskCopyWith<_WorkerTask> get copyWith => __$WorkerTaskCopyWithImpl<_WorkerTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerTask&&(identical(other.date, date) || other.date == date)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.property, property) || other.property == property));
}


@override
int get hashCode => Object.hash(runtimeType,date,start,end,minutes,property);

@override
String toString() {
  return 'WorkerTask(date: $date, start: $start, end: $end, minutes: $minutes, property: $property)';
}


}

/// @nodoc
abstract mixin class _$WorkerTaskCopyWith<$Res> implements $WorkerTaskCopyWith<$Res> {
  factory _$WorkerTaskCopyWith(_WorkerTask value, $Res Function(_WorkerTask) _then) = __$WorkerTaskCopyWithImpl;
@override @useResult
$Res call({
 String date, String start, String end, int minutes, String property
});




}
/// @nodoc
class __$WorkerTaskCopyWithImpl<$Res>
    implements _$WorkerTaskCopyWith<$Res> {
  __$WorkerTaskCopyWithImpl(this._self, this._then);

  final _WorkerTask _self;
  final $Res Function(_WorkerTask) _then;

/// Create a copy of WorkerTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? start = null,Object? end = null,Object? minutes = null,Object? property = null,}) {
  return _then(_WorkerTask(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,property: null == property ? _self.property : property // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
