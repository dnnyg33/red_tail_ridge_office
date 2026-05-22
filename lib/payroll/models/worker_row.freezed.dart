// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerRow {

 String get worker; double get periodHours; double get periodBreaks; double get mileageForPeriod; double get payRate; double get periodHourlyPay; double get mileagePay; DateTime? get periodStart; DateTime? get periodEnd;
/// Create a copy of WorkerRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerRowCopyWith<WorkerRow> get copyWith => _$WorkerRowCopyWithImpl<WorkerRow>(this as WorkerRow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerRow&&(identical(other.worker, worker) || other.worker == worker)&&(identical(other.periodHours, periodHours) || other.periodHours == periodHours)&&(identical(other.periodBreaks, periodBreaks) || other.periodBreaks == periodBreaks)&&(identical(other.mileageForPeriod, mileageForPeriod) || other.mileageForPeriod == mileageForPeriod)&&(identical(other.payRate, payRate) || other.payRate == payRate)&&(identical(other.periodHourlyPay, periodHourlyPay) || other.periodHourlyPay == periodHourlyPay)&&(identical(other.mileagePay, mileagePay) || other.mileagePay == mileagePay)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd));
}


@override
int get hashCode => Object.hash(runtimeType,worker,periodHours,periodBreaks,mileageForPeriod,payRate,periodHourlyPay,mileagePay,periodStart,periodEnd);

@override
String toString() {
  return 'WorkerRow(worker: $worker, periodHours: $periodHours, periodBreaks: $periodBreaks, mileageForPeriod: $mileageForPeriod, payRate: $payRate, periodHourlyPay: $periodHourlyPay, mileagePay: $mileagePay, periodStart: $periodStart, periodEnd: $periodEnd)';
}


}

/// @nodoc
abstract mixin class $WorkerRowCopyWith<$Res>  {
  factory $WorkerRowCopyWith(WorkerRow value, $Res Function(WorkerRow) _then) = _$WorkerRowCopyWithImpl;
@useResult
$Res call({
 String worker, double periodHours, double periodBreaks, double mileageForPeriod, double payRate, double periodHourlyPay, double mileagePay, DateTime? periodStart, DateTime? periodEnd
});




}
/// @nodoc
class _$WorkerRowCopyWithImpl<$Res>
    implements $WorkerRowCopyWith<$Res> {
  _$WorkerRowCopyWithImpl(this._self, this._then);

  final WorkerRow _self;
  final $Res Function(WorkerRow) _then;

/// Create a copy of WorkerRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? worker = null,Object? periodHours = null,Object? periodBreaks = null,Object? mileageForPeriod = null,Object? payRate = null,Object? periodHourlyPay = null,Object? mileagePay = null,Object? periodStart = freezed,Object? periodEnd = freezed,}) {
  return _then(_self.copyWith(
worker: null == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as String,periodHours: null == periodHours ? _self.periodHours : periodHours // ignore: cast_nullable_to_non_nullable
as double,periodBreaks: null == periodBreaks ? _self.periodBreaks : periodBreaks // ignore: cast_nullable_to_non_nullable
as double,mileageForPeriod: null == mileageForPeriod ? _self.mileageForPeriod : mileageForPeriod // ignore: cast_nullable_to_non_nullable
as double,payRate: null == payRate ? _self.payRate : payRate // ignore: cast_nullable_to_non_nullable
as double,periodHourlyPay: null == periodHourlyPay ? _self.periodHourlyPay : periodHourlyPay // ignore: cast_nullable_to_non_nullable
as double,mileagePay: null == mileagePay ? _self.mileagePay : mileagePay // ignore: cast_nullable_to_non_nullable
as double,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerRow].
extension WorkerRowPatterns on WorkerRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerRow value)  $default,){
final _that = this;
switch (_that) {
case _WorkerRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerRow value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String worker,  double periodHours,  double periodBreaks,  double mileageForPeriod,  double payRate,  double periodHourlyPay,  double mileagePay,  DateTime? periodStart,  DateTime? periodEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerRow() when $default != null:
return $default(_that.worker,_that.periodHours,_that.periodBreaks,_that.mileageForPeriod,_that.payRate,_that.periodHourlyPay,_that.mileagePay,_that.periodStart,_that.periodEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String worker,  double periodHours,  double periodBreaks,  double mileageForPeriod,  double payRate,  double periodHourlyPay,  double mileagePay,  DateTime? periodStart,  DateTime? periodEnd)  $default,) {final _that = this;
switch (_that) {
case _WorkerRow():
return $default(_that.worker,_that.periodHours,_that.periodBreaks,_that.mileageForPeriod,_that.payRate,_that.periodHourlyPay,_that.mileagePay,_that.periodStart,_that.periodEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String worker,  double periodHours,  double periodBreaks,  double mileageForPeriod,  double payRate,  double periodHourlyPay,  double mileagePay,  DateTime? periodStart,  DateTime? periodEnd)?  $default,) {final _that = this;
switch (_that) {
case _WorkerRow() when $default != null:
return $default(_that.worker,_that.periodHours,_that.periodBreaks,_that.mileageForPeriod,_that.payRate,_that.periodHourlyPay,_that.mileagePay,_that.periodStart,_that.periodEnd);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerRow extends WorkerRow {
  const _WorkerRow({required this.worker, required this.periodHours, this.periodBreaks = 0.0, required this.mileageForPeriod, required this.payRate, required this.periodHourlyPay, required this.mileagePay, this.periodStart, this.periodEnd}): super._();
  

@override final  String worker;
@override final  double periodHours;
@override@JsonKey() final  double periodBreaks;
@override final  double mileageForPeriod;
@override final  double payRate;
@override final  double periodHourlyPay;
@override final  double mileagePay;
@override final  DateTime? periodStart;
@override final  DateTime? periodEnd;

/// Create a copy of WorkerRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerRowCopyWith<_WorkerRow> get copyWith => __$WorkerRowCopyWithImpl<_WorkerRow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerRow&&(identical(other.worker, worker) || other.worker == worker)&&(identical(other.periodHours, periodHours) || other.periodHours == periodHours)&&(identical(other.periodBreaks, periodBreaks) || other.periodBreaks == periodBreaks)&&(identical(other.mileageForPeriod, mileageForPeriod) || other.mileageForPeriod == mileageForPeriod)&&(identical(other.payRate, payRate) || other.payRate == payRate)&&(identical(other.periodHourlyPay, periodHourlyPay) || other.periodHourlyPay == periodHourlyPay)&&(identical(other.mileagePay, mileagePay) || other.mileagePay == mileagePay)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd));
}


@override
int get hashCode => Object.hash(runtimeType,worker,periodHours,periodBreaks,mileageForPeriod,payRate,periodHourlyPay,mileagePay,periodStart,periodEnd);

@override
String toString() {
  return 'WorkerRow(worker: $worker, periodHours: $periodHours, periodBreaks: $periodBreaks, mileageForPeriod: $mileageForPeriod, payRate: $payRate, periodHourlyPay: $periodHourlyPay, mileagePay: $mileagePay, periodStart: $periodStart, periodEnd: $periodEnd)';
}


}

/// @nodoc
abstract mixin class _$WorkerRowCopyWith<$Res> implements $WorkerRowCopyWith<$Res> {
  factory _$WorkerRowCopyWith(_WorkerRow value, $Res Function(_WorkerRow) _then) = __$WorkerRowCopyWithImpl;
@override @useResult
$Res call({
 String worker, double periodHours, double periodBreaks, double mileageForPeriod, double payRate, double periodHourlyPay, double mileagePay, DateTime? periodStart, DateTime? periodEnd
});




}
/// @nodoc
class __$WorkerRowCopyWithImpl<$Res>
    implements _$WorkerRowCopyWith<$Res> {
  __$WorkerRowCopyWithImpl(this._self, this._then);

  final _WorkerRow _self;
  final $Res Function(_WorkerRow) _then;

/// Create a copy of WorkerRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? worker = null,Object? periodHours = null,Object? periodBreaks = null,Object? mileageForPeriod = null,Object? payRate = null,Object? periodHourlyPay = null,Object? mileagePay = null,Object? periodStart = freezed,Object? periodEnd = freezed,}) {
  return _then(_WorkerRow(
worker: null == worker ? _self.worker : worker // ignore: cast_nullable_to_non_nullable
as String,periodHours: null == periodHours ? _self.periodHours : periodHours // ignore: cast_nullable_to_non_nullable
as double,periodBreaks: null == periodBreaks ? _self.periodBreaks : periodBreaks // ignore: cast_nullable_to_non_nullable
as double,mileageForPeriod: null == mileageForPeriod ? _self.mileageForPeriod : mileageForPeriod // ignore: cast_nullable_to_non_nullable
as double,payRate: null == payRate ? _self.payRate : payRate // ignore: cast_nullable_to_non_nullable
as double,periodHourlyPay: null == periodHourlyPay ? _self.periodHourlyPay : periodHourlyPay // ignore: cast_nullable_to_non_nullable
as double,mileagePay: null == mileagePay ? _self.mileagePay : mileagePay // ignore: cast_nullable_to_non_nullable
as double,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
