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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PreparePayrollStarted value)?  started,TResult Function( PreparePayrollTimeTrackingFileSelected value)?  timeTrackingFileSelected,TResult Function( PreparePayrollNttFileSelected value)?  nttFileSelected,TResult Function( PreparePayrollMileageConstantChanged value)?  mileageConstantChanged,TResult Function( PreparePayrollReportRequested value)?  reportRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PreparePayrollStarted() when started != null:
return started(_that);case PreparePayrollTimeTrackingFileSelected() when timeTrackingFileSelected != null:
return timeTrackingFileSelected(_that);case PreparePayrollNttFileSelected() when nttFileSelected != null:
return nttFileSelected(_that);case PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that);case PreparePayrollReportRequested() when reportRequested != null:
return reportRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PreparePayrollStarted value)  started,required TResult Function( PreparePayrollTimeTrackingFileSelected value)  timeTrackingFileSelected,required TResult Function( PreparePayrollNttFileSelected value)  nttFileSelected,required TResult Function( PreparePayrollMileageConstantChanged value)  mileageConstantChanged,required TResult Function( PreparePayrollReportRequested value)  reportRequested,}){
final _that = this;
switch (_that) {
case PreparePayrollStarted():
return started(_that);case PreparePayrollTimeTrackingFileSelected():
return timeTrackingFileSelected(_that);case PreparePayrollNttFileSelected():
return nttFileSelected(_that);case PreparePayrollMileageConstantChanged():
return mileageConstantChanged(_that);case PreparePayrollReportRequested():
return reportRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PreparePayrollStarted value)?  started,TResult? Function( PreparePayrollTimeTrackingFileSelected value)?  timeTrackingFileSelected,TResult? Function( PreparePayrollNttFileSelected value)?  nttFileSelected,TResult? Function( PreparePayrollMileageConstantChanged value)?  mileageConstantChanged,TResult? Function( PreparePayrollReportRequested value)?  reportRequested,}){
final _that = this;
switch (_that) {
case PreparePayrollStarted() when started != null:
return started(_that);case PreparePayrollTimeTrackingFileSelected() when timeTrackingFileSelected != null:
return timeTrackingFileSelected(_that);case PreparePayrollNttFileSelected() when nttFileSelected != null:
return nttFileSelected(_that);case PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that);case PreparePayrollReportRequested() when reportRequested != null:
return reportRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( PlatformFile file)?  timeTrackingFileSelected,TResult Function( PlatformFile file)?  nttFileSelected,TResult Function( double? value)?  mileageConstantChanged,TResult Function()?  reportRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PreparePayrollStarted() when started != null:
return started();case PreparePayrollTimeTrackingFileSelected() when timeTrackingFileSelected != null:
return timeTrackingFileSelected(_that.file);case PreparePayrollNttFileSelected() when nttFileSelected != null:
return nttFileSelected(_that.file);case PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that.value);case PreparePayrollReportRequested() when reportRequested != null:
return reportRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( PlatformFile file)  timeTrackingFileSelected,required TResult Function( PlatformFile file)  nttFileSelected,required TResult Function( double? value)  mileageConstantChanged,required TResult Function()  reportRequested,}) {final _that = this;
switch (_that) {
case PreparePayrollStarted():
return started();case PreparePayrollTimeTrackingFileSelected():
return timeTrackingFileSelected(_that.file);case PreparePayrollNttFileSelected():
return nttFileSelected(_that.file);case PreparePayrollMileageConstantChanged():
return mileageConstantChanged(_that.value);case PreparePayrollReportRequested():
return reportRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( PlatformFile file)?  timeTrackingFileSelected,TResult? Function( PlatformFile file)?  nttFileSelected,TResult? Function( double? value)?  mileageConstantChanged,TResult? Function()?  reportRequested,}) {final _that = this;
switch (_that) {
case PreparePayrollStarted() when started != null:
return started();case PreparePayrollTimeTrackingFileSelected() when timeTrackingFileSelected != null:
return timeTrackingFileSelected(_that.file);case PreparePayrollNttFileSelected() when nttFileSelected != null:
return nttFileSelected(_that.file);case PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
return mileageConstantChanged(_that.value);case PreparePayrollReportRequested() when reportRequested != null:
return reportRequested();case _:
  return null;

}
}

}

/// @nodoc


class PreparePayrollStarted implements PreparePayrollEvent {
  const PreparePayrollStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreparePayrollEvent.started()';
}


}




/// @nodoc


class PreparePayrollTimeTrackingFileSelected implements PreparePayrollEvent {
  const PreparePayrollTimeTrackingFileSelected(this.file);
  

 final  PlatformFile file;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollTimeTrackingFileSelectedCopyWith<PreparePayrollTimeTrackingFileSelected> get copyWith => _$PreparePayrollTimeTrackingFileSelectedCopyWithImpl<PreparePayrollTimeTrackingFileSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollTimeTrackingFileSelected&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'PreparePayrollEvent.timeTrackingFileSelected(file: $file)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollTimeTrackingFileSelectedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory $PreparePayrollTimeTrackingFileSelectedCopyWith(PreparePayrollTimeTrackingFileSelected value, $Res Function(PreparePayrollTimeTrackingFileSelected) _then) = _$PreparePayrollTimeTrackingFileSelectedCopyWithImpl;
@useResult
$Res call({
 PlatformFile file
});




}
/// @nodoc
class _$PreparePayrollTimeTrackingFileSelectedCopyWithImpl<$Res>
    implements $PreparePayrollTimeTrackingFileSelectedCopyWith<$Res> {
  _$PreparePayrollTimeTrackingFileSelectedCopyWithImpl(this._self, this._then);

  final PreparePayrollTimeTrackingFileSelected _self;
  final $Res Function(PreparePayrollTimeTrackingFileSelected) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(PreparePayrollTimeTrackingFileSelected(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as PlatformFile,
  ));
}


}

/// @nodoc


class PreparePayrollNttFileSelected implements PreparePayrollEvent {
  const PreparePayrollNttFileSelected(this.file);
  

 final  PlatformFile file;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollNttFileSelectedCopyWith<PreparePayrollNttFileSelected> get copyWith => _$PreparePayrollNttFileSelectedCopyWithImpl<PreparePayrollNttFileSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollNttFileSelected&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'PreparePayrollEvent.nttFileSelected(file: $file)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollNttFileSelectedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory $PreparePayrollNttFileSelectedCopyWith(PreparePayrollNttFileSelected value, $Res Function(PreparePayrollNttFileSelected) _then) = _$PreparePayrollNttFileSelectedCopyWithImpl;
@useResult
$Res call({
 PlatformFile file
});




}
/// @nodoc
class _$PreparePayrollNttFileSelectedCopyWithImpl<$Res>
    implements $PreparePayrollNttFileSelectedCopyWith<$Res> {
  _$PreparePayrollNttFileSelectedCopyWithImpl(this._self, this._then);

  final PreparePayrollNttFileSelected _self;
  final $Res Function(PreparePayrollNttFileSelected) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(PreparePayrollNttFileSelected(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as PlatformFile,
  ));
}


}

/// @nodoc


class PreparePayrollMileageConstantChanged implements PreparePayrollEvent {
  const PreparePayrollMileageConstantChanged(this.value);
  

 final  double? value;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollMileageConstantChangedCopyWith<PreparePayrollMileageConstantChanged> get copyWith => _$PreparePayrollMileageConstantChangedCopyWithImpl<PreparePayrollMileageConstantChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollMileageConstantChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreparePayrollEvent.mileageConstantChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollMileageConstantChangedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory $PreparePayrollMileageConstantChangedCopyWith(PreparePayrollMileageConstantChanged value, $Res Function(PreparePayrollMileageConstantChanged) _then) = _$PreparePayrollMileageConstantChangedCopyWithImpl;
@useResult
$Res call({
 double? value
});




}
/// @nodoc
class _$PreparePayrollMileageConstantChangedCopyWithImpl<$Res>
    implements $PreparePayrollMileageConstantChangedCopyWith<$Res> {
  _$PreparePayrollMileageConstantChangedCopyWithImpl(this._self, this._then);

  final PreparePayrollMileageConstantChanged _self;
  final $Res Function(PreparePayrollMileageConstantChanged) _then;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(PreparePayrollMileageConstantChanged(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class PreparePayrollReportRequested implements PreparePayrollEvent {
  const PreparePayrollReportRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollReportRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreparePayrollEvent.reportRequested()';
}


}




/// @nodoc
mixin _$PreparePayrollState {

 AsyncOperation<List<WorkerRow>> get workerRows; DateTime? get payPeriodStart; DateTime? get payPeriodEnd; PlatformFile? get timeTrackingFile;// String? timeTrackingFileName,
// String? timeTrackingFilePath,
// Uint8List? timeTrackingBytes,
// String? nttFileName,
// String? nttFilePath,
// Uint8List? nttBytes,
 PlatformFile? get nttFile; double? get mileageConstant;
/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollStateCopyWith<PreparePayrollState> get copyWith => _$PreparePayrollStateCopyWithImpl<PreparePayrollState>(this as PreparePayrollState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollState&&(identical(other.workerRows, workerRows) || other.workerRows == workerRows)&&(identical(other.payPeriodStart, payPeriodStart) || other.payPeriodStart == payPeriodStart)&&(identical(other.payPeriodEnd, payPeriodEnd) || other.payPeriodEnd == payPeriodEnd)&&(identical(other.timeTrackingFile, timeTrackingFile) || other.timeTrackingFile == timeTrackingFile)&&(identical(other.nttFile, nttFile) || other.nttFile == nttFile)&&(identical(other.mileageConstant, mileageConstant) || other.mileageConstant == mileageConstant));
}


@override
int get hashCode => Object.hash(runtimeType,workerRows,payPeriodStart,payPeriodEnd,timeTrackingFile,nttFile,mileageConstant);

@override
String toString() {
  return 'PreparePayrollState(workerRows: $workerRows, payPeriodStart: $payPeriodStart, payPeriodEnd: $payPeriodEnd, timeTrackingFile: $timeTrackingFile, nttFile: $nttFile, mileageConstant: $mileageConstant)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollStateCopyWith<$Res>  {
  factory $PreparePayrollStateCopyWith(PreparePayrollState value, $Res Function(PreparePayrollState) _then) = _$PreparePayrollStateCopyWithImpl;
@useResult
$Res call({
 AsyncOperation<List<WorkerRow>> workerRows, DateTime? payPeriodStart, DateTime? payPeriodEnd, PlatformFile? timeTrackingFile, PlatformFile? nttFile, double? mileageConstant
});


$AsyncOperationCopyWith<List<WorkerRow>, $Res> get workerRows;

}
/// @nodoc
class _$PreparePayrollStateCopyWithImpl<$Res>
    implements $PreparePayrollStateCopyWith<$Res> {
  _$PreparePayrollStateCopyWithImpl(this._self, this._then);

  final PreparePayrollState _self;
  final $Res Function(PreparePayrollState) _then;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workerRows = null,Object? payPeriodStart = freezed,Object? payPeriodEnd = freezed,Object? timeTrackingFile = freezed,Object? nttFile = freezed,Object? mileageConstant = freezed,}) {
  return _then(_self.copyWith(
workerRows: null == workerRows ? _self.workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as AsyncOperation<List<WorkerRow>>,payPeriodStart: freezed == payPeriodStart ? _self.payPeriodStart : payPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,payPeriodEnd: freezed == payPeriodEnd ? _self.payPeriodEnd : payPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,timeTrackingFile: freezed == timeTrackingFile ? _self.timeTrackingFile : timeTrackingFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,nttFile: freezed == nttFile ? _self.nttFile : nttFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,mileageConstant: freezed == mileageConstant ? _self.mileageConstant : mileageConstant // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AsyncOperation<List<WorkerRow>> workerRows,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  PlatformFile? timeTrackingFile,  PlatformFile? nttFile,  double? mileageConstant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
return $default(_that.workerRows,_that.payPeriodStart,_that.payPeriodEnd,_that.timeTrackingFile,_that.nttFile,_that.mileageConstant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AsyncOperation<List<WorkerRow>> workerRows,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  PlatformFile? timeTrackingFile,  PlatformFile? nttFile,  double? mileageConstant)  $default,) {final _that = this;
switch (_that) {
case _PreparePayrollState():
return $default(_that.workerRows,_that.payPeriodStart,_that.payPeriodEnd,_that.timeTrackingFile,_that.nttFile,_that.mileageConstant);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AsyncOperation<List<WorkerRow>> workerRows,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  PlatformFile? timeTrackingFile,  PlatformFile? nttFile,  double? mileageConstant)?  $default,) {final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
return $default(_that.workerRows,_that.payPeriodStart,_that.payPeriodEnd,_that.timeTrackingFile,_that.nttFile,_that.mileageConstant);case _:
  return null;

}
}

}

/// @nodoc


class _PreparePayrollState extends PreparePayrollState {
  const _PreparePayrollState({this.workerRows = const AsyncOperation.idle(), this.payPeriodStart, this.payPeriodEnd, this.timeTrackingFile, this.nttFile, this.mileageConstant = 0.725}): super._();
  

@override@JsonKey() final  AsyncOperation<List<WorkerRow>> workerRows;
@override final  DateTime? payPeriodStart;
@override final  DateTime? payPeriodEnd;
@override final  PlatformFile? timeTrackingFile;
// String? timeTrackingFileName,
// String? timeTrackingFilePath,
// Uint8List? timeTrackingBytes,
// String? nttFileName,
// String? nttFilePath,
// Uint8List? nttBytes,
@override final  PlatformFile? nttFile;
@override@JsonKey() final  double? mileageConstant;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollStateCopyWith<_PreparePayrollState> get copyWith => __$PreparePayrollStateCopyWithImpl<_PreparePayrollState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollState&&(identical(other.workerRows, workerRows) || other.workerRows == workerRows)&&(identical(other.payPeriodStart, payPeriodStart) || other.payPeriodStart == payPeriodStart)&&(identical(other.payPeriodEnd, payPeriodEnd) || other.payPeriodEnd == payPeriodEnd)&&(identical(other.timeTrackingFile, timeTrackingFile) || other.timeTrackingFile == timeTrackingFile)&&(identical(other.nttFile, nttFile) || other.nttFile == nttFile)&&(identical(other.mileageConstant, mileageConstant) || other.mileageConstant == mileageConstant));
}


@override
int get hashCode => Object.hash(runtimeType,workerRows,payPeriodStart,payPeriodEnd,timeTrackingFile,nttFile,mileageConstant);

@override
String toString() {
  return 'PreparePayrollState(workerRows: $workerRows, payPeriodStart: $payPeriodStart, payPeriodEnd: $payPeriodEnd, timeTrackingFile: $timeTrackingFile, nttFile: $nttFile, mileageConstant: $mileageConstant)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollStateCopyWith<$Res> implements $PreparePayrollStateCopyWith<$Res> {
  factory _$PreparePayrollStateCopyWith(_PreparePayrollState value, $Res Function(_PreparePayrollState) _then) = __$PreparePayrollStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncOperation<List<WorkerRow>> workerRows, DateTime? payPeriodStart, DateTime? payPeriodEnd, PlatformFile? timeTrackingFile, PlatformFile? nttFile, double? mileageConstant
});


@override $AsyncOperationCopyWith<List<WorkerRow>, $Res> get workerRows;

}
/// @nodoc
class __$PreparePayrollStateCopyWithImpl<$Res>
    implements _$PreparePayrollStateCopyWith<$Res> {
  __$PreparePayrollStateCopyWithImpl(this._self, this._then);

  final _PreparePayrollState _self;
  final $Res Function(_PreparePayrollState) _then;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workerRows = null,Object? payPeriodStart = freezed,Object? payPeriodEnd = freezed,Object? timeTrackingFile = freezed,Object? nttFile = freezed,Object? mileageConstant = freezed,}) {
  return _then(_PreparePayrollState(
workerRows: null == workerRows ? _self.workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as AsyncOperation<List<WorkerRow>>,payPeriodStart: freezed == payPeriodStart ? _self.payPeriodStart : payPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,payPeriodEnd: freezed == payPeriodEnd ? _self.payPeriodEnd : payPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,timeTrackingFile: freezed == timeTrackingFile ? _self.timeTrackingFile : timeTrackingFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,nttFile: freezed == nttFile ? _self.nttFile : nttFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,mileageConstant: freezed == mileageConstant ? _self.mileageConstant : mileageConstant // ignore: cast_nullable_to_non_nullable
as double?,
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
}
}

// dart format on
