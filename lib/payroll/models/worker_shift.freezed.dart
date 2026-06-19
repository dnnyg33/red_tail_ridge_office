// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerShift {

 String get date; int get minutes; String get clockIn; String get clockOut;
/// Create a copy of WorkerShift
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerShiftCopyWith<WorkerShift> get copyWith => _$WorkerShiftCopyWithImpl<WorkerShift>(this as WorkerShift, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerShift&&(identical(other.date, date) || other.date == date)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut));
}


@override
int get hashCode => Object.hash(runtimeType,date,minutes,clockIn,clockOut);

@override
String toString() {
  return 'WorkerShift(date: $date, minutes: $minutes, clockIn: $clockIn, clockOut: $clockOut)';
}


}

/// @nodoc
abstract mixin class $WorkerShiftCopyWith<$Res>  {
  factory $WorkerShiftCopyWith(WorkerShift value, $Res Function(WorkerShift) _then) = _$WorkerShiftCopyWithImpl;
@useResult
$Res call({
 String date, int minutes, String clockIn, String clockOut
});




}
/// @nodoc
class _$WorkerShiftCopyWithImpl<$Res>
    implements $WorkerShiftCopyWith<$Res> {
  _$WorkerShiftCopyWithImpl(this._self, this._then);

  final WorkerShift _self;
  final $Res Function(WorkerShift) _then;

/// Create a copy of WorkerShift
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? minutes = null,Object? clockIn = null,Object? clockOut = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,clockIn: null == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as String,clockOut: null == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerShift].
extension WorkerShiftPatterns on WorkerShift {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerShift value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerShift() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerShift value)  $default,){
final _that = this;
switch (_that) {
case _WorkerShift():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerShift value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerShift() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  int minutes,  String clockIn,  String clockOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerShift() when $default != null:
return $default(_that.date,_that.minutes,_that.clockIn,_that.clockOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  int minutes,  String clockIn,  String clockOut)  $default,) {final _that = this;
switch (_that) {
case _WorkerShift():
return $default(_that.date,_that.minutes,_that.clockIn,_that.clockOut);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  int minutes,  String clockIn,  String clockOut)?  $default,) {final _that = this;
switch (_that) {
case _WorkerShift() when $default != null:
return $default(_that.date,_that.minutes,_that.clockIn,_that.clockOut);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerShift implements WorkerShift {
  const _WorkerShift({required this.date, required this.minutes, required this.clockIn, required this.clockOut});
  

@override final  String date;
@override final  int minutes;
@override final  String clockIn;
@override final  String clockOut;

/// Create a copy of WorkerShift
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerShiftCopyWith<_WorkerShift> get copyWith => __$WorkerShiftCopyWithImpl<_WorkerShift>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerShift&&(identical(other.date, date) || other.date == date)&&(identical(other.minutes, minutes) || other.minutes == minutes)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut));
}


@override
int get hashCode => Object.hash(runtimeType,date,minutes,clockIn,clockOut);

@override
String toString() {
  return 'WorkerShift(date: $date, minutes: $minutes, clockIn: $clockIn, clockOut: $clockOut)';
}


}

/// @nodoc
abstract mixin class _$WorkerShiftCopyWith<$Res> implements $WorkerShiftCopyWith<$Res> {
  factory _$WorkerShiftCopyWith(_WorkerShift value, $Res Function(_WorkerShift) _then) = __$WorkerShiftCopyWithImpl;
@override @useResult
$Res call({
 String date, int minutes, String clockIn, String clockOut
});




}
/// @nodoc
class __$WorkerShiftCopyWithImpl<$Res>
    implements _$WorkerShiftCopyWith<$Res> {
  __$WorkerShiftCopyWithImpl(this._self, this._then);

  final _WorkerShift _self;
  final $Res Function(_WorkerShift) _then;

/// Create a copy of WorkerShift
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? minutes = null,Object? clockIn = null,Object? clockOut = null,}) {
  return _then(_WorkerShift(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,minutes: null == minutes ? _self.minutes : minutes // ignore: cast_nullable_to_non_nullable
as int,clockIn: null == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as String,clockOut: null == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
