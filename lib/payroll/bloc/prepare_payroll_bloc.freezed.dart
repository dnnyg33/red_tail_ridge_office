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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String fileName,  String? filePath,  Uint8List? bytes)?  timeTrackingFileSelected,TResult Function( String fileName,  String? filePath,  Uint8List? bytes)?  nttFileSelected,TResult Function( double? value)?  mileageConstantChanged,TResult Function()?  reportRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PreparePayrollStarted() when started != null:
return started();case PreparePayrollTimeTrackingFileSelected() when timeTrackingFileSelected != null:
return timeTrackingFileSelected(_that.fileName,_that.filePath,_that.bytes);case PreparePayrollNttFileSelected() when nttFileSelected != null:
return nttFileSelected(_that.fileName,_that.filePath,_that.bytes);case PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String fileName,  String? filePath,  Uint8List? bytes)  timeTrackingFileSelected,required TResult Function( String fileName,  String? filePath,  Uint8List? bytes)  nttFileSelected,required TResult Function( double? value)  mileageConstantChanged,required TResult Function()  reportRequested,}) {final _that = this;
switch (_that) {
case PreparePayrollStarted():
return started();case PreparePayrollTimeTrackingFileSelected():
return timeTrackingFileSelected(_that.fileName,_that.filePath,_that.bytes);case PreparePayrollNttFileSelected():
return nttFileSelected(_that.fileName,_that.filePath,_that.bytes);case PreparePayrollMileageConstantChanged():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String fileName,  String? filePath,  Uint8List? bytes)?  timeTrackingFileSelected,TResult? Function( String fileName,  String? filePath,  Uint8List? bytes)?  nttFileSelected,TResult? Function( double? value)?  mileageConstantChanged,TResult? Function()?  reportRequested,}) {final _that = this;
switch (_that) {
case PreparePayrollStarted() when started != null:
return started();case PreparePayrollTimeTrackingFileSelected() when timeTrackingFileSelected != null:
return timeTrackingFileSelected(_that.fileName,_that.filePath,_that.bytes);case PreparePayrollNttFileSelected() when nttFileSelected != null:
return nttFileSelected(_that.fileName,_that.filePath,_that.bytes);case PreparePayrollMileageConstantChanged() when mileageConstantChanged != null:
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
  const PreparePayrollTimeTrackingFileSelected({required this.fileName, this.filePath, this.bytes});
  

 final  String fileName;
 final  String? filePath;
 final  Uint8List? bytes;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollTimeTrackingFileSelectedCopyWith<PreparePayrollTimeTrackingFileSelected> get copyWith => _$PreparePayrollTimeTrackingFileSelectedCopyWithImpl<PreparePayrollTimeTrackingFileSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollTimeTrackingFileSelected&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,fileName,filePath,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'PreparePayrollEvent.timeTrackingFileSelected(fileName: $fileName, filePath: $filePath, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollTimeTrackingFileSelectedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory $PreparePayrollTimeTrackingFileSelectedCopyWith(PreparePayrollTimeTrackingFileSelected value, $Res Function(PreparePayrollTimeTrackingFileSelected) _then) = _$PreparePayrollTimeTrackingFileSelectedCopyWithImpl;
@useResult
$Res call({
 String fileName, String? filePath, Uint8List? bytes
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
@pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? filePath = freezed,Object? bytes = freezed,}) {
  return _then(PreparePayrollTimeTrackingFileSelected(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc


class PreparePayrollNttFileSelected implements PreparePayrollEvent {
  const PreparePayrollNttFileSelected({required this.fileName, this.filePath, this.bytes});
  

 final  String fileName;
 final  String? filePath;
 final  Uint8List? bytes;

/// Create a copy of PreparePayrollEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollNttFileSelectedCopyWith<PreparePayrollNttFileSelected> get copyWith => _$PreparePayrollNttFileSelectedCopyWithImpl<PreparePayrollNttFileSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollNttFileSelected&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,fileName,filePath,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'PreparePayrollEvent.nttFileSelected(fileName: $fileName, filePath: $filePath, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollNttFileSelectedCopyWith<$Res> implements $PreparePayrollEventCopyWith<$Res> {
  factory $PreparePayrollNttFileSelectedCopyWith(PreparePayrollNttFileSelected value, $Res Function(PreparePayrollNttFileSelected) _then) = _$PreparePayrollNttFileSelectedCopyWithImpl;
@useResult
$Res call({
 String fileName, String? filePath, Uint8List? bytes
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
@pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? filePath = freezed,Object? bytes = freezed,}) {
  return _then(PreparePayrollNttFileSelected(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
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

 PreparePayrollStatus get status; DateTime? get payPeriodStart; DateTime? get payPeriodEnd; int get employeeCount; String? get timeTrackingFileName; String? get timeTrackingFilePath; Uint8List? get timeTrackingBytes; String? get nttFileName; String? get nttFilePath; Uint8List? get nttBytes; double? get mileageConstant; List<WorkerRow> get workerRows; String? get errorMessage;
/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparePayrollStateCopyWith<PreparePayrollState> get copyWith => _$PreparePayrollStateCopyWithImpl<PreparePayrollState>(this as PreparePayrollState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparePayrollState&&(identical(other.status, status) || other.status == status)&&(identical(other.payPeriodStart, payPeriodStart) || other.payPeriodStart == payPeriodStart)&&(identical(other.payPeriodEnd, payPeriodEnd) || other.payPeriodEnd == payPeriodEnd)&&(identical(other.employeeCount, employeeCount) || other.employeeCount == employeeCount)&&(identical(other.timeTrackingFileName, timeTrackingFileName) || other.timeTrackingFileName == timeTrackingFileName)&&(identical(other.timeTrackingFilePath, timeTrackingFilePath) || other.timeTrackingFilePath == timeTrackingFilePath)&&const DeepCollectionEquality().equals(other.timeTrackingBytes, timeTrackingBytes)&&(identical(other.nttFileName, nttFileName) || other.nttFileName == nttFileName)&&(identical(other.nttFilePath, nttFilePath) || other.nttFilePath == nttFilePath)&&const DeepCollectionEquality().equals(other.nttBytes, nttBytes)&&(identical(other.mileageConstant, mileageConstant) || other.mileageConstant == mileageConstant)&&const DeepCollectionEquality().equals(other.workerRows, workerRows)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,payPeriodStart,payPeriodEnd,employeeCount,timeTrackingFileName,timeTrackingFilePath,const DeepCollectionEquality().hash(timeTrackingBytes),nttFileName,nttFilePath,const DeepCollectionEquality().hash(nttBytes),mileageConstant,const DeepCollectionEquality().hash(workerRows),errorMessage);

@override
String toString() {
  return 'PreparePayrollState(status: $status, payPeriodStart: $payPeriodStart, payPeriodEnd: $payPeriodEnd, employeeCount: $employeeCount, timeTrackingFileName: $timeTrackingFileName, timeTrackingFilePath: $timeTrackingFilePath, timeTrackingBytes: $timeTrackingBytes, nttFileName: $nttFileName, nttFilePath: $nttFilePath, nttBytes: $nttBytes, mileageConstant: $mileageConstant, workerRows: $workerRows, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PreparePayrollStateCopyWith<$Res>  {
  factory $PreparePayrollStateCopyWith(PreparePayrollState value, $Res Function(PreparePayrollState) _then) = _$PreparePayrollStateCopyWithImpl;
@useResult
$Res call({
 PreparePayrollStatus status, DateTime? payPeriodStart, DateTime? payPeriodEnd, int employeeCount, String? timeTrackingFileName, String? timeTrackingFilePath, Uint8List? timeTrackingBytes, String? nttFileName, String? nttFilePath, Uint8List? nttBytes, double? mileageConstant, List<WorkerRow> workerRows, String? errorMessage
});




}
/// @nodoc
class _$PreparePayrollStateCopyWithImpl<$Res>
    implements $PreparePayrollStateCopyWith<$Res> {
  _$PreparePayrollStateCopyWithImpl(this._self, this._then);

  final PreparePayrollState _self;
  final $Res Function(PreparePayrollState) _then;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? payPeriodStart = freezed,Object? payPeriodEnd = freezed,Object? employeeCount = null,Object? timeTrackingFileName = freezed,Object? timeTrackingFilePath = freezed,Object? timeTrackingBytes = freezed,Object? nttFileName = freezed,Object? nttFilePath = freezed,Object? nttBytes = freezed,Object? mileageConstant = freezed,Object? workerRows = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PreparePayrollStatus,payPeriodStart: freezed == payPeriodStart ? _self.payPeriodStart : payPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,payPeriodEnd: freezed == payPeriodEnd ? _self.payPeriodEnd : payPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,employeeCount: null == employeeCount ? _self.employeeCount : employeeCount // ignore: cast_nullable_to_non_nullable
as int,timeTrackingFileName: freezed == timeTrackingFileName ? _self.timeTrackingFileName : timeTrackingFileName // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingFilePath: freezed == timeTrackingFilePath ? _self.timeTrackingFilePath : timeTrackingFilePath // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingBytes: freezed == timeTrackingBytes ? _self.timeTrackingBytes : timeTrackingBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,nttFileName: freezed == nttFileName ? _self.nttFileName : nttFileName // ignore: cast_nullable_to_non_nullable
as String?,nttFilePath: freezed == nttFilePath ? _self.nttFilePath : nttFilePath // ignore: cast_nullable_to_non_nullable
as String?,nttBytes: freezed == nttBytes ? _self.nttBytes : nttBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,mileageConstant: freezed == mileageConstant ? _self.mileageConstant : mileageConstant // ignore: cast_nullable_to_non_nullable
as double?,workerRows: null == workerRows ? _self.workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as List<WorkerRow>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PreparePayrollStatus status,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  int employeeCount,  String? timeTrackingFileName,  String? timeTrackingFilePath,  Uint8List? timeTrackingBytes,  String? nttFileName,  String? nttFilePath,  Uint8List? nttBytes,  double? mileageConstant,  List<WorkerRow> workerRows,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
return $default(_that.status,_that.payPeriodStart,_that.payPeriodEnd,_that.employeeCount,_that.timeTrackingFileName,_that.timeTrackingFilePath,_that.timeTrackingBytes,_that.nttFileName,_that.nttFilePath,_that.nttBytes,_that.mileageConstant,_that.workerRows,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PreparePayrollStatus status,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  int employeeCount,  String? timeTrackingFileName,  String? timeTrackingFilePath,  Uint8List? timeTrackingBytes,  String? nttFileName,  String? nttFilePath,  Uint8List? nttBytes,  double? mileageConstant,  List<WorkerRow> workerRows,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PreparePayrollState():
return $default(_that.status,_that.payPeriodStart,_that.payPeriodEnd,_that.employeeCount,_that.timeTrackingFileName,_that.timeTrackingFilePath,_that.timeTrackingBytes,_that.nttFileName,_that.nttFilePath,_that.nttBytes,_that.mileageConstant,_that.workerRows,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PreparePayrollStatus status,  DateTime? payPeriodStart,  DateTime? payPeriodEnd,  int employeeCount,  String? timeTrackingFileName,  String? timeTrackingFilePath,  Uint8List? timeTrackingBytes,  String? nttFileName,  String? nttFilePath,  Uint8List? nttBytes,  double? mileageConstant,  List<WorkerRow> workerRows,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PreparePayrollState() when $default != null:
return $default(_that.status,_that.payPeriodStart,_that.payPeriodEnd,_that.employeeCount,_that.timeTrackingFileName,_that.timeTrackingFilePath,_that.timeTrackingBytes,_that.nttFileName,_that.nttFilePath,_that.nttBytes,_that.mileageConstant,_that.workerRows,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PreparePayrollState extends PreparePayrollState {
  const _PreparePayrollState({this.status = PreparePayrollStatus.initial, this.payPeriodStart, this.payPeriodEnd, this.employeeCount = 0, this.timeTrackingFileName, this.timeTrackingFilePath, this.timeTrackingBytes, this.nttFileName, this.nttFilePath, this.nttBytes, this.mileageConstant = 0.725, final  List<WorkerRow> workerRows = const <WorkerRow>[], this.errorMessage}): _workerRows = workerRows,super._();
  

@override@JsonKey() final  PreparePayrollStatus status;
@override final  DateTime? payPeriodStart;
@override final  DateTime? payPeriodEnd;
@override@JsonKey() final  int employeeCount;
@override final  String? timeTrackingFileName;
@override final  String? timeTrackingFilePath;
@override final  Uint8List? timeTrackingBytes;
@override final  String? nttFileName;
@override final  String? nttFilePath;
@override final  Uint8List? nttBytes;
@override@JsonKey() final  double? mileageConstant;
 final  List<WorkerRow> _workerRows;
@override@JsonKey() List<WorkerRow> get workerRows {
  if (_workerRows is EqualUnmodifiableListView) return _workerRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workerRows);
}

@override final  String? errorMessage;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparePayrollStateCopyWith<_PreparePayrollState> get copyWith => __$PreparePayrollStateCopyWithImpl<_PreparePayrollState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparePayrollState&&(identical(other.status, status) || other.status == status)&&(identical(other.payPeriodStart, payPeriodStart) || other.payPeriodStart == payPeriodStart)&&(identical(other.payPeriodEnd, payPeriodEnd) || other.payPeriodEnd == payPeriodEnd)&&(identical(other.employeeCount, employeeCount) || other.employeeCount == employeeCount)&&(identical(other.timeTrackingFileName, timeTrackingFileName) || other.timeTrackingFileName == timeTrackingFileName)&&(identical(other.timeTrackingFilePath, timeTrackingFilePath) || other.timeTrackingFilePath == timeTrackingFilePath)&&const DeepCollectionEquality().equals(other.timeTrackingBytes, timeTrackingBytes)&&(identical(other.nttFileName, nttFileName) || other.nttFileName == nttFileName)&&(identical(other.nttFilePath, nttFilePath) || other.nttFilePath == nttFilePath)&&const DeepCollectionEquality().equals(other.nttBytes, nttBytes)&&(identical(other.mileageConstant, mileageConstant) || other.mileageConstant == mileageConstant)&&const DeepCollectionEquality().equals(other._workerRows, _workerRows)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,payPeriodStart,payPeriodEnd,employeeCount,timeTrackingFileName,timeTrackingFilePath,const DeepCollectionEquality().hash(timeTrackingBytes),nttFileName,nttFilePath,const DeepCollectionEquality().hash(nttBytes),mileageConstant,const DeepCollectionEquality().hash(_workerRows),errorMessage);

@override
String toString() {
  return 'PreparePayrollState(status: $status, payPeriodStart: $payPeriodStart, payPeriodEnd: $payPeriodEnd, employeeCount: $employeeCount, timeTrackingFileName: $timeTrackingFileName, timeTrackingFilePath: $timeTrackingFilePath, timeTrackingBytes: $timeTrackingBytes, nttFileName: $nttFileName, nttFilePath: $nttFilePath, nttBytes: $nttBytes, mileageConstant: $mileageConstant, workerRows: $workerRows, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PreparePayrollStateCopyWith<$Res> implements $PreparePayrollStateCopyWith<$Res> {
  factory _$PreparePayrollStateCopyWith(_PreparePayrollState value, $Res Function(_PreparePayrollState) _then) = __$PreparePayrollStateCopyWithImpl;
@override @useResult
$Res call({
 PreparePayrollStatus status, DateTime? payPeriodStart, DateTime? payPeriodEnd, int employeeCount, String? timeTrackingFileName, String? timeTrackingFilePath, Uint8List? timeTrackingBytes, String? nttFileName, String? nttFilePath, Uint8List? nttBytes, double? mileageConstant, List<WorkerRow> workerRows, String? errorMessage
});




}
/// @nodoc
class __$PreparePayrollStateCopyWithImpl<$Res>
    implements _$PreparePayrollStateCopyWith<$Res> {
  __$PreparePayrollStateCopyWithImpl(this._self, this._then);

  final _PreparePayrollState _self;
  final $Res Function(_PreparePayrollState) _then;

/// Create a copy of PreparePayrollState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? payPeriodStart = freezed,Object? payPeriodEnd = freezed,Object? employeeCount = null,Object? timeTrackingFileName = freezed,Object? timeTrackingFilePath = freezed,Object? timeTrackingBytes = freezed,Object? nttFileName = freezed,Object? nttFilePath = freezed,Object? nttBytes = freezed,Object? mileageConstant = freezed,Object? workerRows = null,Object? errorMessage = freezed,}) {
  return _then(_PreparePayrollState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PreparePayrollStatus,payPeriodStart: freezed == payPeriodStart ? _self.payPeriodStart : payPeriodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,payPeriodEnd: freezed == payPeriodEnd ? _self.payPeriodEnd : payPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,employeeCount: null == employeeCount ? _self.employeeCount : employeeCount // ignore: cast_nullable_to_non_nullable
as int,timeTrackingFileName: freezed == timeTrackingFileName ? _self.timeTrackingFileName : timeTrackingFileName // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingFilePath: freezed == timeTrackingFilePath ? _self.timeTrackingFilePath : timeTrackingFilePath // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingBytes: freezed == timeTrackingBytes ? _self.timeTrackingBytes : timeTrackingBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,nttFileName: freezed == nttFileName ? _self.nttFileName : nttFileName // ignore: cast_nullable_to_non_nullable
as String?,nttFilePath: freezed == nttFilePath ? _self.nttFilePath : nttFilePath // ignore: cast_nullable_to_non_nullable
as String?,nttBytes: freezed == nttBytes ? _self.nttBytes : nttBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,mileageConstant: freezed == mileageConstant ? _self.mileageConstant : mileageConstant // ignore: cast_nullable_to_non_nullable
as double?,workerRows: null == workerRows ? _self._workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as List<WorkerRow>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
