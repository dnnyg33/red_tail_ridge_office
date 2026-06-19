// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_day_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StaffDayTime {

 int get id; int get staffId; DateTime? get clockIn; DateTime? get clockOut; num? get mileageIn; num? get mileageOut; bool get autoLogOut;
/// Create a copy of StaffDayTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffDayTimeCopyWith<StaffDayTime> get copyWith => _$StaffDayTimeCopyWithImpl<StaffDayTime>(this as StaffDayTime, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffDayTime&&(identical(other.id, id) || other.id == id)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.mileageIn, mileageIn) || other.mileageIn == mileageIn)&&(identical(other.mileageOut, mileageOut) || other.mileageOut == mileageOut)&&(identical(other.autoLogOut, autoLogOut) || other.autoLogOut == autoLogOut));
}


@override
int get hashCode => Object.hash(runtimeType,id,staffId,clockIn,clockOut,mileageIn,mileageOut,autoLogOut);

@override
String toString() {
  return 'StaffDayTime(id: $id, staffId: $staffId, clockIn: $clockIn, clockOut: $clockOut, mileageIn: $mileageIn, mileageOut: $mileageOut, autoLogOut: $autoLogOut)';
}


}

/// @nodoc
abstract mixin class $StaffDayTimeCopyWith<$Res>  {
  factory $StaffDayTimeCopyWith(StaffDayTime value, $Res Function(StaffDayTime) _then) = _$StaffDayTimeCopyWithImpl;
@useResult
$Res call({
 int id, int staffId, DateTime? clockIn, DateTime? clockOut, num? mileageIn, num? mileageOut, bool autoLogOut
});




}
/// @nodoc
class _$StaffDayTimeCopyWithImpl<$Res>
    implements $StaffDayTimeCopyWith<$Res> {
  _$StaffDayTimeCopyWithImpl(this._self, this._then);

  final StaffDayTime _self;
  final $Res Function(StaffDayTime) _then;

/// Create a copy of StaffDayTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? staffId = null,Object? clockIn = freezed,Object? clockOut = freezed,Object? mileageIn = freezed,Object? mileageOut = freezed,Object? autoLogOut = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as int,clockIn: freezed == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOut: freezed == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as DateTime?,mileageIn: freezed == mileageIn ? _self.mileageIn : mileageIn // ignore: cast_nullable_to_non_nullable
as num?,mileageOut: freezed == mileageOut ? _self.mileageOut : mileageOut // ignore: cast_nullable_to_non_nullable
as num?,autoLogOut: null == autoLogOut ? _self.autoLogOut : autoLogOut // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffDayTime].
extension StaffDayTimePatterns on StaffDayTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffDayTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffDayTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffDayTime value)  $default,){
final _that = this;
switch (_that) {
case _StaffDayTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffDayTime value)?  $default,){
final _that = this;
switch (_that) {
case _StaffDayTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int staffId,  DateTime? clockIn,  DateTime? clockOut,  num? mileageIn,  num? mileageOut,  bool autoLogOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffDayTime() when $default != null:
return $default(_that.id,_that.staffId,_that.clockIn,_that.clockOut,_that.mileageIn,_that.mileageOut,_that.autoLogOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int staffId,  DateTime? clockIn,  DateTime? clockOut,  num? mileageIn,  num? mileageOut,  bool autoLogOut)  $default,) {final _that = this;
switch (_that) {
case _StaffDayTime():
return $default(_that.id,_that.staffId,_that.clockIn,_that.clockOut,_that.mileageIn,_that.mileageOut,_that.autoLogOut);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int staffId,  DateTime? clockIn,  DateTime? clockOut,  num? mileageIn,  num? mileageOut,  bool autoLogOut)?  $default,) {final _that = this;
switch (_that) {
case _StaffDayTime() when $default != null:
return $default(_that.id,_that.staffId,_that.clockIn,_that.clockOut,_that.mileageIn,_that.mileageOut,_that.autoLogOut);case _:
  return null;

}
}

}

/// @nodoc


class _StaffDayTime extends StaffDayTime {
  const _StaffDayTime({required this.id, required this.staffId, this.clockIn, this.clockOut, this.mileageIn, this.mileageOut, this.autoLogOut = false}): super._();
  

@override final  int id;
@override final  int staffId;
@override final  DateTime? clockIn;
@override final  DateTime? clockOut;
@override final  num? mileageIn;
@override final  num? mileageOut;
@override@JsonKey() final  bool autoLogOut;

/// Create a copy of StaffDayTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffDayTimeCopyWith<_StaffDayTime> get copyWith => __$StaffDayTimeCopyWithImpl<_StaffDayTime>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffDayTime&&(identical(other.id, id) || other.id == id)&&(identical(other.staffId, staffId) || other.staffId == staffId)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.mileageIn, mileageIn) || other.mileageIn == mileageIn)&&(identical(other.mileageOut, mileageOut) || other.mileageOut == mileageOut)&&(identical(other.autoLogOut, autoLogOut) || other.autoLogOut == autoLogOut));
}


@override
int get hashCode => Object.hash(runtimeType,id,staffId,clockIn,clockOut,mileageIn,mileageOut,autoLogOut);

@override
String toString() {
  return 'StaffDayTime(id: $id, staffId: $staffId, clockIn: $clockIn, clockOut: $clockOut, mileageIn: $mileageIn, mileageOut: $mileageOut, autoLogOut: $autoLogOut)';
}


}

/// @nodoc
abstract mixin class _$StaffDayTimeCopyWith<$Res> implements $StaffDayTimeCopyWith<$Res> {
  factory _$StaffDayTimeCopyWith(_StaffDayTime value, $Res Function(_StaffDayTime) _then) = __$StaffDayTimeCopyWithImpl;
@override @useResult
$Res call({
 int id, int staffId, DateTime? clockIn, DateTime? clockOut, num? mileageIn, num? mileageOut, bool autoLogOut
});




}
/// @nodoc
class __$StaffDayTimeCopyWithImpl<$Res>
    implements _$StaffDayTimeCopyWith<$Res> {
  __$StaffDayTimeCopyWithImpl(this._self, this._then);

  final _StaffDayTime _self;
  final $Res Function(_StaffDayTime) _then;

/// Create a copy of StaffDayTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? staffId = null,Object? clockIn = freezed,Object? clockOut = freezed,Object? mileageIn = freezed,Object? mileageOut = freezed,Object? autoLogOut = null,}) {
  return _then(_StaffDayTime(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,staffId: null == staffId ? _self.staffId : staffId // ignore: cast_nullable_to_non_nullable
as int,clockIn: freezed == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOut: freezed == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as DateTime?,mileageIn: freezed == mileageIn ? _self.mileageIn : mileageIn // ignore: cast_nullable_to_non_nullable
as num?,mileageOut: freezed == mileageOut ? _self.mileageOut : mileageOut // ignore: cast_nullable_to_non_nullable
as num?,autoLogOut: null == autoLogOut ? _self.autoLogOut : autoLogOut // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
