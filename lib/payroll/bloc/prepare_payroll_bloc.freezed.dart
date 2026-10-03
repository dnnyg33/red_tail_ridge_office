// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prepare_payroll_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreparePayrollEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreparePayrollEvent()';
}


}

/// @nodoc
class $PreparePayrollEventCopyWith<$Res>  {
$PreparePayrollEventCopyWith(PreparePayrollEvent _, $Res Function(PreparePayrollEvent) __);
}


/// Adds pattern-matching-related methods to [PreparePayrollEvent].
extension PreparePayrollEventPatterns on PreparePayrollEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PreparePayrollStarted value)?  started,TResult Function( _PreparePayrollBonusEligibilityChanged value)?  bonusEligibilityChanged,TResult Function( _PreparePayrollMileageConstantChanged value)?  mileageConstantChanged,TResult Function( _PreparePayrollHeathDeductionsChanged value)?  heathDeductionsChanged,TResult Function( _PreparePayrollCleaningRevenueChanged value)?  cleaningRevenueChanged,TResult Function( _PreparePayrollStartDateChanged value)?  startDateChanged,TResult Function( _PreparePayrollEndDateChanged value)?  endDateChanged,TResult Function( _PreparePayrollStaffDayTimesRequested value)?  staffDayTimesRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreparePayrollStarted() when started != null:
return started(_that);case _PreparePayrollBonusEligibilityChanged() when bonusEligibilityChanged != null:
return bonusEligibilityChanged(_that);case _PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that);case _PreparePayrollHeathDeductionsChanged() when heathDeductionsChanged != null:
return heathDeductionsChanged(_that);case _PreparePayrollCleaningRevenueChanged() when cleaningRevenueChanged != null:
return cleaningRevenueChanged(_that);case _PreparePayrollStartDateChanged() when startDateChanged != null:
return startDateChanged(_that);case _PreparePayrollEndDateChanged() when endDateChanged != null:
return endDateChanged(_that);case _PreparePayrollStaffDayTimesRequested() when staffDayTimesRequested != null:
return staffDayTimesRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PreparePayrollStarted value)  started,required TResult Function( _PreparePayrollBonusEligibilityChanged value)  bonusEligibilityChanged,required TResult Function( _PreparePayrollMileageConstantChanged value)  mileageConstantChanged,required TResult Function( _PreparePayrollHeathDeductionsChanged value)  heathDeductionsChanged,required TResult Function( _PreparePayrollCleaningRevenueChanged value)  cleaningRevenueChanged,required TResult Function( _PreparePayrollStartDateChanged value)  startDateChanged,required TResult Function( _PreparePayrollEndDateChanged value)  endDateChanged,required TResult Function( _PreparePayrollStaffDayTimesRequested value)  staffDayTimesRequested,}){
final _that = this;
switch (_that) {
case _PreparePayrollStarted():
return started(_that);case _PreparePayrollBonusEligibilityChanged():
return bonusEligibilityChanged(_that);case _PreparePayrollMileageConstantChanged():
return mileageConstantChanged(_that);case _PreparePayrollHeathDeductionsChanged():
return heathDeductionsChanged(_that);case _PreparePayrollCleaningRevenueChanged():
return cleaningRevenueChanged(_that);case _PreparePayrollStartDateChanged():
return startDateChanged(_that);case _PreparePayrollEndDateChanged():
return endDateChanged(_that);case _PreparePayrollStaffDayTimesRequested():
return staffDayTimesRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PreparePayrollStarted value)?  started,TResult? Function( _PreparePayrollBonusEligibilityChanged value)?  bonusEligibilityChanged,TResult? Function( _PreparePayrollMileageConstantChanged value)?  mileageConstantChanged,TResult? Function( _PreparePayrollHeathDeductionsChanged value)?  heathDeductionsChanged,TResult? Function( _PreparePayrollCleaningRevenueChanged value)?  cleaningRevenueChanged,TResult? Function( _PreparePayrollStartDateChanged value)?  startDateChanged,TResult? Function( _PreparePayrollEndDateChanged value)?  endDateChanged,TResult? Function( _PreparePayrollStaffDayTimesRequested value)?  staffDayTimesRequested,}){
final _that = this;
switch (_that) {
case _PreparePayrollStarted() when started != null:
return started(_that);case _PreparePayrollBonusEligibilityChanged() when bonusEligibilityChanged != null:
return bonusEligibilityChanged(_that);case _PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that);case _PreparePayrollHeathDeductionsChanged() when heathDeductionsChanged != null:
return heathDeductionsChanged(_that);case _PreparePayrollCleaningRevenueChanged() when cleaningRevenueChanged != null:
return cleaningRevenueChanged(_that);case _PreparePayrollStartDateChanged() when startDateChanged != null:
return startDateChanged(_that);case _PreparePayrollEndDateChanged() when endDateChanged != null:
return endDateChanged(_that);case _PreparePayrollStaffDayTimesRequested() when staffDayTimesRequested != null:
return staffDayTimesRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Map<int, bool> qualifiesForBonusById)?  bonusEligibilityChanged,TResult Function( double? value)?  mileageConstantChanged,TResult Function( double? value)?  heathDeductionsChanged,TResult Function( double? value)?  cleaningRevenueChanged,TResult Function( DateTime? date)?  startDateChanged,TResult Function( DateTime? date)?  endDateChanged,TResult Function()?  staffDayTimesRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparePayrollStarted() when started != null:
return started();case _PreparePayrollBonusEligibilityChanged() when bonusEligibilityChanged != null:
return bonusEligibilityChanged(_that.qualifiesForBonusById);case _PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that.value);case _PreparePayrollHeathDeductionsChanged() when heathDeductionsChanged != null:
return heathDeductionsChanged(_that.value);case _PreparePayrollCleaningRevenueChanged() when cleaningRevenueChanged != null:
return cleaningRevenueChanged(_that.value);case _PreparePayrollStartDateChanged() when startDateChanged != null:
return startDateChanged(_that.date);case _PreparePayrollEndDateChanged() when endDateChanged != null:
return endDateChanged(_that.date);case _PreparePayrollStaffDayTimesRequested() when staffDayTimesRequested != null:
return staffDayTimesRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Map<int, bool> qualifiesForBonusById)  bonusEligibilityChanged,required TResult Function( double? value)  mileageConstantChanged,required TResult Function( double? value)  heathDeductionsChanged,required TResult Function( double? value)  cleaningRevenueChanged,required TResult Function( DateTime? date)  startDateChanged,required TResult Function( DateTime? date)  endDateChanged,required TResult Function()  staffDayTimesRequested,}) {final _that = this;
switch (_that) {
case _PreparePayrollStarted():
return started();case _PreparePayrollBonusEligibilityChanged():
return bonusEligibilityChanged(_that.qualifiesForBonusById);case _PreparePayrollMileageConstantChanged():
return mileageConstantChanged(_that.value);case _PreparePayrollHeathDeductionsChanged():
return heathDeductionsChanged(_that.value);case _PreparePayrollCleaningRevenueChanged():
return cleaningRevenueChanged(_that.value);case _PreparePayrollStartDateChanged():
return startDateChanged(_that.date);case _PreparePayrollEndDateChanged():
return endDateChanged(_that.date);case _PreparePayrollStaffDayTimesRequested():
return staffDayTimesRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Map<int, bool> qualifiesForBonusById)?  bonusEligibilityChanged,TResult? Function( double? value)?  mileageConstantChanged,TResult? Function( double? value)?  heathDeductionsChanged,TResult? Function( double? value)?  cleaningRevenueChanged,TResult? Function( DateTime? date)?  startDateChanged,TResult? Function( DateTime? date)?  endDateChanged,TResult? Function()?  staffDayTimesRequested,}) {final _that = this;
switch (_that) {
case _PreparePayrollStarted() when started != null:
return started();case _PreparePayrollBonusEligibilityChanged() when bonusEligibilityChanged != null:
return bonusEligibilityChanged(_that.qualifiesForBonusById);case _PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that.value);case _PreparePayrollHeathDeductionsChanged() when heathDeductionsChanged != null:
return heathDeductionsChanged(_that.value);case _PreparePayrollCleaningRevenueChanged() when cleaningRevenueChanged != null:
return cleaningRevenueChanged(_that.value);case _PreparePayrollStartDateChanged() when startDateChanged != null:
return startDateChanged(_that.date);case _PreparePayrollEndDateChanged() when endDateChanged != null:
return endDateChanged(_that.date);case _PreparePayrollStaffDayTimesRequested() when staffDayTimesRequested != null:
return staffDayTimesRequested();case _:
  return null;

}
}

}

/// @nodoc


class _PreparePayrollStarted implements PreparePayrollEvent {
  const _PreparePayrollStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreparePayrollEvent.started()';
}


}




/// @nodoc


class _PreparePayrollBonusEligibilityChanged implements PreparePayrollEvent {
  const _PreparePayrollBonusEligibilityChanged(final  Map<int, bool> qualifiesForBonusById): _qualifiesForBonusById = qualifiesForBonusById;
  

 final  Map<int, bool> _qualifiesForBonusById;
 Map<int, bool> get qualifiesForBonusById {
  if (_qualifiesForBonusById is EqualUnmodifiableMapView) return _qualifiesForBonusById;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_qualifiesForBonusById);
}


/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollBonusEligibilityChangedCopyWith<_PreparePayrollBonusEligibilityChanged> get copyWith => __$PreparePayrollBonusEligibilityChangedCopyWithImpl<_PreparePayrollBonusEligibilityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollBonusEligibilityChanged&&const DeepCollectionEquality().equals(other._qualifiesForBonusById, _qualifiesForBonusById));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_qualifiesForBonusById));

@override
String toString() {
  return 'PreparePayrollEvent.bonusEligibilityChanged(qualifiesForBonusById: $qualifiesForBonusById)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollBonusEligibilityChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory _$PreparePayrollBonusEligibilityChangedCopyWith(_PreparePayrollBonusEligibilityChanged value, $Res Function(_PreparePayrollBonusEligibilityChanged) _then) = __$PreparePayrollBonusEligibilityChangedCopyWithImpl;
@useResult
$Res call({
 Map<int, bool> qualifiesForBonusById
});




}
/// @nodoc
class __$PreparePayrollBonusEligibilityChangedCopyWithImpl<$Res>
    implements _$PreparePayrollBonusEligibilityChangedCopyWith<$Res> {
  __$PreparePayrollBonusEligibilityChangedCopyWithImpl(this._self, this._then);

  final _PreparePayrollBonusEligibilityChanged _self;
  final $Res Function(_PreparePayrollBonusEligibilityChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? qualifiesForBonusById = null,}) {
  return _then(_PreparePayrollBonusEligibilityChanged(
null == qualifiesForBonusById ? _self._qualifiesForBonusById : qualifiesForBonusById // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}


}

/// @nodoc


class _PreparePayrollMileageConstantChanged implements PreparePayrollEvent {
  const _PreparePayrollMileageConstantChanged(this.value);
  

 final  double? value;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollMileageConstantChangedCopyWith<_PreparePayrollMileageConstantChanged> get copyWith => __$PreparePayrollMileageConstantChangedCopyWithImpl<_PreparePayrollMileageConstantChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollMileageConstantChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreparePayrollEvent.mileageConstantChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollMileageConstantChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory _$PreparePayrollMileageConstantChangedCopyWith(_PreparePayrollMileageConstantChanged value, $Res Function(_PreparePayrollMileageConstantChanged) _then) = __$PreparePayrollMileageConstantChangedCopyWithImpl;
@useResult
$Res call({
 double? value
});




}
/// @nodoc
class __$PreparePayrollMileageConstantChangedCopyWithImpl<$Res>
    implements _$PreparePayrollMileageConstantChangedCopyWith<$Res> {
  __$PreparePayrollMileageConstantChangedCopyWithImpl(this._self, this._then);

  final _PreparePayrollMileageConstantChanged _self;
  final $Res Function(_PreparePayrollMileageConstantChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(_PreparePayrollMileageConstantChanged(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class _PreparePayrollHeathDeductionsChanged implements PreparePayrollEvent {
  const _PreparePayrollHeathDeductionsChanged(this.value);
  

 final  double? value;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollHeathDeductionsChangedCopyWith<_PreparePayrollHeathDeductionsChanged> get copyWith => __$PreparePayrollHeathDeductionsChangedCopyWithImpl<_PreparePayrollHeathDeductionsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollHeathDeductionsChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreparePayrollEvent.heathDeductionsChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollHeathDeductionsChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory _$PreparePayrollHeathDeductionsChangedCopyWith(_PreparePayrollHeathDeductionsChanged value, $Res Function(_PreparePayrollHeathDeductionsChanged) _then) = __$PreparePayrollHeathDeductionsChangedCopyWithImpl;
@useResult
$Res call({
 double? value
});




}
/// @nodoc
class __$PreparePayrollHeathDeductionsChangedCopyWithImpl<$Res>
    implements _$PreparePayrollHeathDeductionsChangedCopyWith<$Res> {
  __$PreparePayrollHeathDeductionsChangedCopyWithImpl(this._self, this._then);

  final _PreparePayrollHeathDeductionsChanged _self;
  final $Res Function(_PreparePayrollHeathDeductionsChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(_PreparePayrollHeathDeductionsChanged(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class _PreparePayrollCleaningRevenueChanged implements PreparePayrollEvent {
  const _PreparePayrollCleaningRevenueChanged(this.value);
  

 final  double? value;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollCleaningRevenueChangedCopyWith<_PreparePayrollCleaningRevenueChanged> get copyWith => __$PreparePayrollCleaningRevenueChangedCopyWithImpl<_PreparePayrollCleaningRevenueChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollCleaningRevenueChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreparePayrollEvent.cleaningRevenueChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollCleaningRevenueChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory _$PreparePayrollCleaningRevenueChangedCopyWith(_PreparePayrollCleaningRevenueChanged value, $Res Function(_PreparePayrollCleaningRevenueChanged) _then) = __$PreparePayrollCleaningRevenueChangedCopyWithImpl;
@useResult
$Res call({
 double? value
});




}
/// @nodoc
class __$PreparePayrollCleaningRevenueChangedCopyWithImpl<$Res>
    implements _$PreparePayrollCleaningRevenueChangedCopyWith<$Res> {
  __$PreparePayrollCleaningRevenueChangedCopyWithImpl(this._self, this._then);

  final _PreparePayrollCleaningRevenueChanged _self;
  final $Res Function(_PreparePayrollCleaningRevenueChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(_PreparePayrollCleaningRevenueChanged(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class _PreparePayrollStartDateChanged implements PreparePayrollEvent {
  const _PreparePayrollStartDateChanged(this.date);
  

 final  DateTime? date;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollStartDateChangedCopyWith<_PreparePayrollStartDateChanged> get copyWith => __$PreparePayrollStartDateChangedCopyWithImpl<_PreparePayrollStartDateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollStartDateChanged&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'PreparePayrollEvent.startDateChanged(date: $date)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollStartDateChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory _$PreparePayrollStartDateChangedCopyWith(_PreparePayrollStartDateChanged value, $Res Function(_PreparePayrollStartDateChanged) _then) = __$PreparePayrollStartDateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime? date
});




}
/// @nodoc
class __$PreparePayrollStartDateChangedCopyWithImpl<$Res>
    implements _$PreparePayrollStartDateChangedCopyWith<$Res> {
  __$PreparePayrollStartDateChangedCopyWithImpl(this._self, this._then);

  final _PreparePayrollStartDateChanged _self;
  final $Res Function(_PreparePayrollStartDateChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = freezed,}) {
  return _then(_PreparePayrollStartDateChanged(
freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _PreparePayrollEndDateChanged implements PreparePayrollEvent {
  const _PreparePayrollEndDateChanged(this.date);
  

 final  DateTime? date;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollEndDateChangedCopyWith<_PreparePayrollEndDateChanged> get copyWith => __$PreparePayrollEndDateChangedCopyWithImpl<_PreparePayrollEndDateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollEndDateChanged&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'PreparePayrollEvent.endDateChanged(date: $date)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollEndDateChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory _$PreparePayrollEndDateChangedCopyWith(_PreparePayrollEndDateChanged value, $Res Function(_PreparePayrollEndDateChanged) _then) = __$PreparePayrollEndDateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime? date
});




}
/// @nodoc
class __$PreparePayrollEndDateChangedCopyWithImpl<$Res>
    implements _$PreparePayrollEndDateChangedCopyWith<$Res> {
  __$PreparePayrollEndDateChangedCopyWithImpl(this._self, this._then);

  final _PreparePayrollEndDateChanged _self;
  final $Res Function(_PreparePayrollEndDateChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = freezed,}) {
  return _then(_PreparePayrollEndDateChanged(
freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class _PreparePayrollStaffDayTimesRequested implements PreparePayrollEvent {
  const _PreparePayrollStaffDayTimesRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollStaffDayTimesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreparePayrollEvent.staffDayTimesRequested()';
}


}




/// @nodoc
mixin _$PreparePayrollState {

 AsyncOperation<List<WorkerRow>> get workerRows; DateTime? get payPeriodStart; DateTime? get payPeriodEnd; double? get mileageConstant; double? get heathDeductions; double? get cleaningRevenue; DateTime? get startDate; DateTime? get endDate; AsyncOperation<List<StaffDayTime>> get staffDayTimes; List<StaffTaskTime> get staffTaskTimes; List<StaffTask> get staffTasks; Map<int, String> get staffNamesById;/// Workers (by Operto `StaffID`) whose cleans earn a share of the bonus
/// pot. Operto exposes no such field, so it's entered in-app and persisted
/// across runs; a worker absent from the map does not qualify.
 Map<int, bool> get qualifiesForBonusById;
/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollStateCopyWith<PreparePayrollState> get copyWith => _$PreparePayrollStateCopyWithImpl<PreparePayrollState>(this as PreparePayrollState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollState&&(identical(other.workerRows, workerRows) || other.workerRows == workerRows)&&(identical(other.payPeriodStart, payPeriodStart) || other.payPeriodStart == payPeriodStart)&&(identical(other.payPeriodEnd, payPeriodEnd) || other.payPeriodEnd == payPeriodEnd)&&(identical(other.mileageConstant, mileageConstant) || other.mileageConstant == mileageConstant)&&(identical(other.heathDeductions, heathDeductions) || other.heathDeductions == heathDeductions)&&(identical(other.cleaningRevenue, cleaningRevenue) || other.cleaningRevenue == cleaningRevenue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.staffDayTimes, staffDayTimes) || other.staffDayTimes == staffDayTimes)&&const DeepCollectionEquality().equals(other.staffTaskTimes, staffTaskTimes)&&const DeepCollectionEquality().equals(other.staffTasks, staffTasks)&&const DeepCollectionEquality().equals(other.staffNamesById, staffNamesById)&&const DeepCollectionEquality().equals(other.qualifiesForBonusById, qualifiesForBonusById));
}


@override
int get hashCode => Object.hash(runtimeType,workerRows,payPeriodStart,payPeriodEnd,mileageConstant,heathDeductions,cleaningRevenue,startDate,endDate,staffDayTimes,const DeepCollectionEquality().hash(staffTaskTimes),const DeepCollectionEquality().hash(staffTasks),const DeepCollectionEquality().hash(staffNamesById),const DeepCollectionEquality().hash(qualifiesForBonusById));

@override
String toString() {
  return 'PreparePayrollState(workerRows: $workerRows, payPeriodStart: $payPeriodStart, payPeriodEnd: $payPeriodEnd, mileageConstant: $mileageConstant, heathDeductions: $heathDeductions, cleaningRevenue: $cleaningRevenue, startDate: $startDate, endDate: $endDate, staffDayTimes: $staffDayTimes, staffTaskTimes: $staffTaskTimes, staffTasks: $staffTasks, staffNamesById: $staffNamesById, qualifiesForBonusById: $qualifiesForBonusById)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollStateCopyWith<$Res>  {
  factory $PreparePayrollStateCopyWith(PreparePayrollState value, $Res Function(PreparePayrollState) _then) = _$PreparePayrollStateCopyWithImpl;
@useResult
$Res call({
 AsyncOperation<List<WorkerRow>> workerRows, DateTime? payPeriodStart, DateTime? payPeriodEnd, double? mileageConstant, double? heathDeductions, double? cleaningRevenue, DateTime? startDate, DateTime? endDate, AsyncOperation<List<StaffDayTime>> staffDayTimes, List<StaffTaskTime> staffTaskTimes, List<StaffTask> staffTasks, Map<int, String> staffNamesById, Map<int, bool> qualifiesForBonusById
});


$AsyncOperationCopyWith<List<WorkerRow>, $Res> get workerRows;$AsyncOperationCopyWith<List<StaffDayTime>, $Res> get staffDayTimes;

}
/// @nodoc
class _$PreparePayrollStateCopyWithImpl<$Res>
    implements $PreparePayrollStateCopyWith<$Res> {
  _$PreparePayrollStateCopyWithImpl(this._self, this._then);

  final PreparePayrollState _self;
  final $Res Function(PreparePayrollState) _then;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workerRows = null,Object? payPeriodStart = freezed,Object? payPeriodEnd = freezed,Object? mileageConstant = freezed,Object? heathDeductions = freezed,Object? cleaningRevenue = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? staffDayTimes = null,Object? staffTaskTimes = null,Object? staffTasks = null,Object? staffNamesById = null,Object? qualifiesForBonusById = null,}) {
  return _then(_self.copyWith(
workerRows: null == workerRows ? _self.workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as AsyncOperation<List<WorkerRow>>,payPeriodStart: freezed == payPeriodStart ? _self.payPeriodStart : payPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,payPeriodEnd: freezed == payPeriodEnd ? _self.payPeriodEnd : payPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,mileageConstant: freezed == mileageConstant ? _self.mileageConstant : mileageConstant // ignore: cast_nullable_to_non_nullable
as double?,heathDeductions: freezed == heathDeductions ? _self.heathDeductions : heathDeductions // ignore: cast_nullable_to_non_nullable
as double?,cleaningRevenue: freezed == cleaningRevenue ? _self.cleaningRevenue : cleaningRevenue // ignore: cast_nullable_to_non_nullable
as double?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,staffDayTimes: null == staffDayTimes ? _self.staffDayTimes : staffDayTimes // ignore: cast_nullable_to_non_nullable
as AsyncOperation<List<StaffDayTime>>,staffTaskTimes: null == staffTaskTimes ? _self.staffTaskTimes : staffTaskTimes // ignore: cast_nullable_to_non_nullable
as List<StaffTaskTime>,staffTasks: null == staffTasks ? _self.staffTasks : staffTasks // ignore: cast_nullable_to_non_nullable
as List<StaffTask>,staffNamesById: null == staffNamesById ? _self.staffNamesById : staffNamesById // ignore: cast_nullable_to_non_nullable
as Map<int, String>,qualifiesForBonusById: null == qualifiesForBonusById ? _self.qualifiesForBonusById : qualifiesForBonusById // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}
/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncOperationCopyWith<List<WorkerRow>, $Res> get workerRows {
  
  return $AsyncOperationCopyWith<List<WorkerRow>, $Res>(_self.workerRows, (value) {
    return _then(_self.copyWith(workerRows: value));
  });
}/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncOperationCopyWith<List<StaffDayTime>, $Res> get staffDayTimes {
  
  return $AsyncOperationCopyWith<List<StaffDayTime>, $Res>(_self.staffDayTimes, (value) {
    return _then(_self.copyWith(staffDayTimes: value));
  });
}
}


/// Adds pattern-matching-related methods to [PreparePayrollState].
extension PreparePayrollStatePatterns on PreparePayrollState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreparePayrollState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreparePayrollState value)  $default,){
final _that = this;
switch (_that) {
case _PreparePayrollState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreparePayrollState value)?  $default,){
final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncOperation<List<WorkerRow>> workerRows,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  double? mileageConstant,  double? heathDeductions,  double? cleaningRevenue,  DateTime? startDate,  DateTime? endDate,  AsyncOperation<List<StaffDayTime>> staffDayTimes,  List<StaffTaskTime> staffTaskTimes,  List<StaffTask> staffTasks,  Map<int, String> staffNamesById,  Map<int, bool> qualifiesForBonusById)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
return $default(_that.workerRows,_that.payPeriodStart,_that.payPeriodEnd,_that.mileageConstant,_that.heathDeductions,_that.cleaningRevenue,_that.startDate,_that.endDate,_that.staffDayTimes,_that.staffTaskTimes,_that.staffTasks,_that.staffNamesById,_that.qualifiesForBonusById);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncOperation<List<WorkerRow>> workerRows,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  double? mileageConstant,  double? heathDeductions,  double? cleaningRevenue,  DateTime? startDate,  DateTime? endDate,  AsyncOperation<List<StaffDayTime>> staffDayTimes,  List<StaffTaskTime> staffTaskTimes,  List<StaffTask> staffTasks,  Map<int, String> staffNamesById,  Map<int, bool> qualifiesForBonusById)  $default,) {final _that = this;
switch (_that) {
case _PreparePayrollState():
return $default(_that.workerRows,_that.payPeriodStart,_that.payPeriodEnd,_that.mileageConstant,_that.heathDeductions,_that.cleaningRevenue,_that.startDate,_that.endDate,_that.staffDayTimes,_that.staffTaskTimes,_that.staffTasks,_that.staffNamesById,_that.qualifiesForBonusById);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncOperation<List<WorkerRow>> workerRows,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  double? mileageConstant,  double? heathDeductions,  double? cleaningRevenue,  DateTime? startDate,  DateTime? endDate,  AsyncOperation<List<StaffDayTime>> staffDayTimes,  List<StaffTaskTime> staffTaskTimes,  List<StaffTask> staffTasks,  Map<int, String> staffNamesById,  Map<int, bool> qualifiesForBonusById)?  $default,) {final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
return $default(_that.workerRows,_that.payPeriodStart,_that.payPeriodEnd,_that.mileageConstant,_that.heathDeductions,_that.cleaningRevenue,_that.startDate,_that.endDate,_that.staffDayTimes,_that.staffTaskTimes,_that.staffTasks,_that.staffNamesById,_that.qualifiesForBonusById);case _:
  return null;

}
}

}

/// @nodoc


class _PreparePayrollState extends PreparePayrollState {
  const _PreparePayrollState({this.workerRows = const AsyncOperation.idle(), this.payPeriodStart, this.payPeriodEnd, this.mileageConstant = 0.725, this.heathDeductions, this.cleaningRevenue, this.startDate, this.endDate, this.staffDayTimes = const AsyncOperation.idle(), final  List<StaffTaskTime> staffTaskTimes = const <StaffTaskTime>[], final  List<StaffTask> staffTasks = const <StaffTask>[], final  Map<int, String> staffNamesById = const <int, String>{}, final  Map<int, bool> qualifiesForBonusById = const <int, bool>{}}): _staffTaskTimes = staffTaskTimes,_staffTasks = staffTasks,_staffNamesById = staffNamesById,_qualifiesForBonusById = qualifiesForBonusById,super._();
  

@override@JsonKey() final  AsyncOperation<List<WorkerRow>> workerRows;
@override final  DateTime? payPeriodStart;
@override final  DateTime? payPeriodEnd;
@override@JsonKey() final  double? mileageConstant;
@override final  double? heathDeductions;
@override final  double? cleaningRevenue;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  AsyncOperation<List<StaffDayTime>> staffDayTimes;
 final  List<StaffTaskTime> _staffTaskTimes;
@override@JsonKey() List<StaffTaskTime> get staffTaskTimes {
  if (_staffTaskTimes is EqualUnmodifiableListView) return _staffTaskTimes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staffTaskTimes);
}

 final  List<StaffTask> _staffTasks;
@override@JsonKey() List<StaffTask> get staffTasks {
  if (_staffTasks is EqualUnmodifiableListView) return _staffTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staffTasks);
}

 final  Map<int, String> _staffNamesById;
@override@JsonKey() Map<int, String> get staffNamesById {
  if (_staffNamesById is EqualUnmodifiableMapView) return _staffNamesById;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_staffNamesById);
}

/// Workers (by Operto `StaffID`) whose cleans earn a share of the bonus
/// pot. Operto exposes no such field, so it's entered in-app and persisted
/// across runs; a worker absent from the map does not qualify.
 final  Map<int, bool> _qualifiesForBonusById;
/// Workers (by Operto `StaffID`) whose cleans earn a share of the bonus
/// pot. Operto exposes no such field, so it's entered in-app and persisted
/// across runs; a worker absent from the map does not qualify.
@override@JsonKey() Map<int, bool> get qualifiesForBonusById {
  if (_qualifiesForBonusById is EqualUnmodifiableMapView) return _qualifiesForBonusById;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_qualifiesForBonusById);
}


/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollStateCopyWith<_PreparePayrollState> get copyWith => __$PreparePayrollStateCopyWithImpl<_PreparePayrollState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollState&&(identical(other.workerRows, workerRows) || other.workerRows == workerRows)&&(identical(other.payPeriodStart, payPeriodStart) || other.payPeriodStart == payPeriodStart)&&(identical(other.payPeriodEnd, payPeriodEnd) || other.payPeriodEnd == payPeriodEnd)&&(identical(other.mileageConstant, mileageConstant) || other.mileageConstant == mileageConstant)&&(identical(other.heathDeductions, heathDeductions) || other.heathDeductions == heathDeductions)&&(identical(other.cleaningRevenue, cleaningRevenue) || other.cleaningRevenue == cleaningRevenue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.staffDayTimes, staffDayTimes) || other.staffDayTimes == staffDayTimes)&&const DeepCollectionEquality().equals(other._staffTaskTimes, _staffTaskTimes)&&const DeepCollectionEquality().equals(other._staffTasks, _staffTasks)&&const DeepCollectionEquality().equals(other._staffNamesById, _staffNamesById)&&const DeepCollectionEquality().equals(other._qualifiesForBonusById, _qualifiesForBonusById));
}


@override
int get hashCode => Object.hash(runtimeType,workerRows,payPeriodStart,payPeriodEnd,mileageConstant,heathDeductions,cleaningRevenue,startDate,endDate,staffDayTimes,const DeepCollectionEquality().hash(_staffTaskTimes),const DeepCollectionEquality().hash(_staffTasks),const DeepCollectionEquality().hash(_staffNamesById),const DeepCollectionEquality().hash(_qualifiesForBonusById));

@override
String toString() {
  return 'PreparePayrollState(workerRows: $workerRows, payPeriodStart: $payPeriodStart, payPeriodEnd: $payPeriodEnd, mileageConstant: $mileageConstant, heathDeductions: $heathDeductions, cleaningRevenue: $cleaningRevenue, startDate: $startDate, endDate: $endDate, staffDayTimes: $staffDayTimes, staffTaskTimes: $staffTaskTimes, staffTasks: $staffTasks, staffNamesById: $staffNamesById, qualifiesForBonusById: $qualifiesForBonusById)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollStateCopyWith<$Res> implements $PreparePayrollStateCopyWith<$Res> {
  factory _$PreparePayrollStateCopyWith(_PreparePayrollState value, $Res Function(_PreparePayrollState) _then) = __$PreparePayrollStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncOperation<List<WorkerRow>> workerRows, DateTime? payPeriodStart, DateTime? payPeriodEnd, double? mileageConstant, double? heathDeductions, double? cleaningRevenue, DateTime? startDate, DateTime? endDate, AsyncOperation<List<StaffDayTime>> staffDayTimes, List<StaffTaskTime> staffTaskTimes, List<StaffTask> staffTasks, Map<int, String> staffNamesById, Map<int, bool> qualifiesForBonusById
});


@override $AsyncOperationCopyWith<List<WorkerRow>, $Res> get workerRows;@override $AsyncOperationCopyWith<List<StaffDayTime>, $Res> get staffDayTimes;

}
/// @nodoc
class __$PreparePayrollStateCopyWithImpl<$Res>
    implements _$PreparePayrollStateCopyWith<$Res> {
  __$PreparePayrollStateCopyWithImpl(this._self, this._then);

  final _PreparePayrollState _self;
  final $Res Function(_PreparePayrollState) _then;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workerRows = null,Object? payPeriodStart = freezed,Object? payPeriodEnd = freezed,Object? mileageConstant = freezed,Object? heathDeductions = freezed,Object? cleaningRevenue = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? staffDayTimes = null,Object? staffTaskTimes = null,Object? staffTasks = null,Object? staffNamesById = null,Object? qualifiesForBonusById = null,}) {
  return _then(_PreparePayrollState(
workerRows: null == workerRows ? _self.workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as AsyncOperation<List<WorkerRow>>,payPeriodStart: freezed == payPeriodStart ? _self.payPeriodStart : payPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,payPeriodEnd: freezed == payPeriodEnd ? _self.payPeriodEnd : payPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,mileageConstant: freezed == mileageConstant ? _self.mileageConstant : mileageConstant // ignore: cast_nullable_to_non_nullable
as double?,heathDeductions: freezed == heathDeductions ? _self.heathDeductions : heathDeductions // ignore: cast_nullable_to_non_nullable
as double?,cleaningRevenue: freezed == cleaningRevenue ? _self.cleaningRevenue : cleaningRevenue // ignore: cast_nullable_to_non_nullable
as double?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,staffDayTimes: null == staffDayTimes ? _self.staffDayTimes : staffDayTimes // ignore: cast_nullable_to_non_nullable
as AsyncOperation<List<StaffDayTime>>,staffTaskTimes: null == staffTaskTimes ? _self._staffTaskTimes : staffTaskTimes // ignore: cast_nullable_to_non_nullable
as List<StaffTaskTime>,staffTasks: null == staffTasks ? _self._staffTasks : staffTasks // ignore: cast_nullable_to_non_nullable
as List<StaffTask>,staffNamesById: null == staffNamesById ? _self._staffNamesById : staffNamesById // ignore: cast_nullable_to_non_nullable
as Map<int, String>,qualifiesForBonusById: null == qualifiesForBonusById ? _self._qualifiesForBonusById : qualifiesForBonusById // ignore: cast_nullable_to_non_nullable
as Map<int, bool>,
  ));
}

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncOperationCopyWith<List<WorkerRow>, $Res> get workerRows {
  
  return $AsyncOperationCopyWith<List<WorkerRow>, $Res>(_self.workerRows, (value) {
    return _then(_self.copyWith(workerRows: value));
  });
}/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncOperationCopyWith<List<StaffDayTime>, $Res> get staffDayTimes {
  
  return $AsyncOperationCopyWith<List<StaffDayTime>, $Res>(_self.staffDayTimes, (value) {
    return _then(_self.copyWith(staffDayTimes: value));
  });
}
}

// dart format on
