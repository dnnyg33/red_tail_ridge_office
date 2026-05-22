// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_ntt_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateNttEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNttEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateNttEvent()';
}


}

/// @nodoc
class $CreateNttEventCopyWith<$Res>  {
$CreateNttEventCopyWith(CreateNttEvent _, $Res Function(CreateNttEvent) __);
}


/// Adds pattern-matching-related methods to [CreateNttEvent].
extension CreateNttEventPatterns on CreateNttEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateNttStarted value)?  started,TResult Function( CreateNttTimeTrackingTaskFileSelected value)?  timeTrackingTaskFileSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started(_that);case CreateNttTimeTrackingTaskFileSelected() when timeTrackingTaskFileSelected != null:
return timeTrackingTaskFileSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateNttStarted value)  started,required TResult Function( CreateNttTimeTrackingTaskFileSelected value)  timeTrackingTaskFileSelected,}){
final _that = this;
switch (_that) {
case CreateNttStarted():
return started(_that);case CreateNttTimeTrackingTaskFileSelected():
return timeTrackingTaskFileSelected(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateNttStarted value)?  started,TResult? Function( CreateNttTimeTrackingTaskFileSelected value)?  timeTrackingTaskFileSelected,}){
final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started(_that);case CreateNttTimeTrackingTaskFileSelected() when timeTrackingTaskFileSelected != null:
return timeTrackingTaskFileSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String fileName,  String? filePath,  Uint8List? bytes)?  timeTrackingTaskFileSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started();case CreateNttTimeTrackingTaskFileSelected() when timeTrackingTaskFileSelected != null:
return timeTrackingTaskFileSelected(_that.fileName,_that.filePath,_that.bytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String fileName,  String? filePath,  Uint8List? bytes)  timeTrackingTaskFileSelected,}) {final _that = this;
switch (_that) {
case CreateNttStarted():
return started();case CreateNttTimeTrackingTaskFileSelected():
return timeTrackingTaskFileSelected(_that.fileName,_that.filePath,_that.bytes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String fileName,  String? filePath,  Uint8List? bytes)?  timeTrackingTaskFileSelected,}) {final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started();case CreateNttTimeTrackingTaskFileSelected() when timeTrackingTaskFileSelected != null:
return timeTrackingTaskFileSelected(_that.fileName,_that.filePath,_that.bytes);case _:
  return null;

}
}

}

/// @nodoc


class CreateNttStarted implements CreateNttEvent {
  const CreateNttStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNttStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateNttEvent.started()';
}


}




/// @nodoc


class CreateNttTimeTrackingTaskFileSelected implements CreateNttEvent {
  const CreateNttTimeTrackingTaskFileSelected({required this.fileName, this.filePath, this.bytes});
  

 final  String fileName;
 final  String? filePath;
 final  Uint8List? bytes;

/// Create a copy of CreateNttEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNttTimeTrackingTaskFileSelectedCopyWith<CreateNttTimeTrackingTaskFileSelected> get copyWith => _$CreateNttTimeTrackingTaskFileSelectedCopyWithImpl<CreateNttTimeTrackingTaskFileSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNttTimeTrackingTaskFileSelected&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,fileName,filePath,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'CreateNttEvent.timeTrackingTaskFileSelected(fileName: $fileName, filePath: $filePath, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $CreateNttTimeTrackingTaskFileSelectedCopyWith<$Res> implements $CreateNttEventCopyWith<$Res> {
  factory $CreateNttTimeTrackingTaskFileSelectedCopyWith(CreateNttTimeTrackingTaskFileSelected value, $Res Function(CreateNttTimeTrackingTaskFileSelected) _then) = _$CreateNttTimeTrackingTaskFileSelectedCopyWithImpl;
@useResult
$Res call({
 String fileName, String? filePath, Uint8List? bytes
});




}
/// @nodoc
class _$CreateNttTimeTrackingTaskFileSelectedCopyWithImpl<$Res>
    implements $CreateNttTimeTrackingTaskFileSelectedCopyWith<$Res> {
  _$CreateNttTimeTrackingTaskFileSelectedCopyWithImpl(this._self, this._then);

  final CreateNttTimeTrackingTaskFileSelected _self;
  final $Res Function(CreateNttTimeTrackingTaskFileSelected) _then;

/// Create a copy of CreateNttEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fileName = null,Object? filePath = freezed,Object? bytes = freezed,}) {
  return _then(CreateNttTimeTrackingTaskFileSelected(
fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,bytes: freezed == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

/// @nodoc
mixin _$CreateNttState {

 CreateNttStatus get status; String? get timeTrackingTaskFileName; String? get timeTrackingTaskFilePath; Uint8List? get timeTrackingTaskBytes; List<TaskRow> get workerRows;
/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNttStateCopyWith<CreateNttState> get copyWith => _$CreateNttStateCopyWithImpl<CreateNttState>(this as CreateNttState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNttState&&(identical(other.status, status) || other.status == status)&&(identical(other.timeTrackingTaskFileName, timeTrackingTaskFileName) || other.timeTrackingTaskFileName == timeTrackingTaskFileName)&&(identical(other.timeTrackingTaskFilePath, timeTrackingTaskFilePath) || other.timeTrackingTaskFilePath == timeTrackingTaskFilePath)&&const DeepCollectionEquality().equals(other.timeTrackingTaskBytes, timeTrackingTaskBytes)&&const DeepCollectionEquality().equals(other.workerRows, workerRows));
}


@override
int get hashCode => Object.hash(runtimeType,status,timeTrackingTaskFileName,timeTrackingTaskFilePath,const DeepCollectionEquality().hash(timeTrackingTaskBytes),const DeepCollectionEquality().hash(workerRows));

@override
String toString() {
  return 'CreateNttState(status: $status, timeTrackingTaskFileName: $timeTrackingTaskFileName, timeTrackingTaskFilePath: $timeTrackingTaskFilePath, timeTrackingTaskBytes: $timeTrackingTaskBytes, workerRows: $workerRows)';
}


}

/// @nodoc
abstract mixin class $CreateNttStateCopyWith<$Res>  {
  factory $CreateNttStateCopyWith(CreateNttState value, $Res Function(CreateNttState) _then) = _$CreateNttStateCopyWithImpl;
@useResult
$Res call({
 CreateNttStatus status, String? timeTrackingTaskFileName, String? timeTrackingTaskFilePath, Uint8List? timeTrackingTaskBytes, List<TaskRow> workerRows
});




}
/// @nodoc
class _$CreateNttStateCopyWithImpl<$Res>
    implements $CreateNttStateCopyWith<$Res> {
  _$CreateNttStateCopyWithImpl(this._self, this._then);

  final CreateNttState _self;
  final $Res Function(CreateNttState) _then;

/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? timeTrackingTaskFileName = freezed,Object? timeTrackingTaskFilePath = freezed,Object? timeTrackingTaskBytes = freezed,Object? workerRows = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateNttStatus,timeTrackingTaskFileName: freezed == timeTrackingTaskFileName ? _self.timeTrackingTaskFileName : timeTrackingTaskFileName // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskFilePath: freezed == timeTrackingTaskFilePath ? _self.timeTrackingTaskFilePath : timeTrackingTaskFilePath // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskBytes: freezed == timeTrackingTaskBytes ? _self.timeTrackingTaskBytes : timeTrackingTaskBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,workerRows: null == workerRows ? _self.workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as List<TaskRow>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateNttState].
extension CreateNttStatePatterns on CreateNttState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateNttState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateNttState value)  $default,){
final _that = this;
switch (_that) {
case _CreateNttState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateNttState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateNttStatus status,  String? timeTrackingTaskFileName,  String? timeTrackingTaskFilePath,  Uint8List? timeTrackingTaskBytes,  List<TaskRow> workerRows)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
return $default(_that.status,_that.timeTrackingTaskFileName,_that.timeTrackingTaskFilePath,_that.timeTrackingTaskBytes,_that.workerRows);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateNttStatus status,  String? timeTrackingTaskFileName,  String? timeTrackingTaskFilePath,  Uint8List? timeTrackingTaskBytes,  List<TaskRow> workerRows)  $default,) {final _that = this;
switch (_that) {
case _CreateNttState():
return $default(_that.status,_that.timeTrackingTaskFileName,_that.timeTrackingTaskFilePath,_that.timeTrackingTaskBytes,_that.workerRows);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateNttStatus status,  String? timeTrackingTaskFileName,  String? timeTrackingTaskFilePath,  Uint8List? timeTrackingTaskBytes,  List<TaskRow> workerRows)?  $default,) {final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
return $default(_that.status,_that.timeTrackingTaskFileName,_that.timeTrackingTaskFilePath,_that.timeTrackingTaskBytes,_that.workerRows);case _:
  return null;

}
}

}

/// @nodoc


class _CreateNttState implements CreateNttState {
  const _CreateNttState({this.status = CreateNttStatus.initial, this.timeTrackingTaskFileName, this.timeTrackingTaskFilePath, this.timeTrackingTaskBytes, final  List<TaskRow> workerRows = const []}): _workerRows = workerRows;
  

@override@JsonKey() final  CreateNttStatus status;
@override final  String? timeTrackingTaskFileName;
@override final  String? timeTrackingTaskFilePath;
@override final  Uint8List? timeTrackingTaskBytes;
 final  List<TaskRow> _workerRows;
@override@JsonKey() List<TaskRow> get workerRows {
  if (_workerRows is EqualUnmodifiableListView) return _workerRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workerRows);
}


/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNttStateCopyWith<_CreateNttState> get copyWith => __$CreateNttStateCopyWithImpl<_CreateNttState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNttState&&(identical(other.status, status) || other.status == status)&&(identical(other.timeTrackingTaskFileName, timeTrackingTaskFileName) || other.timeTrackingTaskFileName == timeTrackingTaskFileName)&&(identical(other.timeTrackingTaskFilePath, timeTrackingTaskFilePath) || other.timeTrackingTaskFilePath == timeTrackingTaskFilePath)&&const DeepCollectionEquality().equals(other.timeTrackingTaskBytes, timeTrackingTaskBytes)&&const DeepCollectionEquality().equals(other._workerRows, _workerRows));
}


@override
int get hashCode => Object.hash(runtimeType,status,timeTrackingTaskFileName,timeTrackingTaskFilePath,const DeepCollectionEquality().hash(timeTrackingTaskBytes),const DeepCollectionEquality().hash(_workerRows));

@override
String toString() {
  return 'CreateNttState(status: $status, timeTrackingTaskFileName: $timeTrackingTaskFileName, timeTrackingTaskFilePath: $timeTrackingTaskFilePath, timeTrackingTaskBytes: $timeTrackingTaskBytes, workerRows: $workerRows)';
}


}

/// @nodoc
abstract mixin class _$CreateNttStateCopyWith<$Res> implements $CreateNttStateCopyWith<$Res> {
  factory _$CreateNttStateCopyWith(_CreateNttState value, $Res Function(_CreateNttState) _then) = __$CreateNttStateCopyWithImpl;
@override @useResult
$Res call({
 CreateNttStatus status, String? timeTrackingTaskFileName, String? timeTrackingTaskFilePath, Uint8List? timeTrackingTaskBytes, List<TaskRow> workerRows
});




}
/// @nodoc
class __$CreateNttStateCopyWithImpl<$Res>
    implements _$CreateNttStateCopyWith<$Res> {
  __$CreateNttStateCopyWithImpl(this._self, this._then);

  final _CreateNttState _self;
  final $Res Function(_CreateNttState) _then;

/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? timeTrackingTaskFileName = freezed,Object? timeTrackingTaskFilePath = freezed,Object? timeTrackingTaskBytes = freezed,Object? workerRows = null,}) {
  return _then(_CreateNttState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateNttStatus,timeTrackingTaskFileName: freezed == timeTrackingTaskFileName ? _self.timeTrackingTaskFileName : timeTrackingTaskFileName // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskFilePath: freezed == timeTrackingTaskFilePath ? _self.timeTrackingTaskFilePath : timeTrackingTaskFilePath // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskBytes: freezed == timeTrackingTaskBytes ? _self.timeTrackingTaskBytes : timeTrackingTaskBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,workerRows: null == workerRows ? _self._workerRows : workerRows // ignore: cast_nullable_to_non_nullable
as List<TaskRow>,
  ));
}


}

/// @nodoc
mixin _$TaskRow {

 String get name; String get date; String get clockIn; String get clockOut; String get shiftTotalTime; int get propertyChanges; int get proposedNTT;
/// Create a copy of TaskRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskRowCopyWith<TaskRow> get copyWith => _$TaskRowCopyWithImpl<TaskRow>(this as TaskRow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskRow&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.shiftTotalTime, shiftTotalTime) || other.shiftTotalTime == shiftTotalTime)&&(identical(other.propertyChanges, propertyChanges) || other.propertyChanges == propertyChanges)&&(identical(other.proposedNTT, proposedNTT) || other.proposedNTT == proposedNTT));
}


@override
int get hashCode => Object.hash(runtimeType,name,date,clockIn,clockOut,shiftTotalTime,propertyChanges,proposedNTT);

@override
String toString() {
  return 'TaskRow(name: $name, date: $date, clockIn: $clockIn, clockOut: $clockOut, shiftTotalTime: $shiftTotalTime, propertyChanges: $propertyChanges, proposedNTT: $proposedNTT)';
}


}

/// @nodoc
abstract mixin class $TaskRowCopyWith<$Res>  {
  factory $TaskRowCopyWith(TaskRow value, $Res Function(TaskRow) _then) = _$TaskRowCopyWithImpl;
@useResult
$Res call({
 String name, String date, String clockIn, String clockOut, String shiftTotalTime, int propertyChanges, int proposedNTT
});




}
/// @nodoc
class _$TaskRowCopyWithImpl<$Res>
    implements $TaskRowCopyWith<$Res> {
  _$TaskRowCopyWithImpl(this._self, this._then);

  final TaskRow _self;
  final $Res Function(TaskRow) _then;

/// Create a copy of TaskRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? date = null,Object? clockIn = null,Object? clockOut = null,Object? shiftTotalTime = null,Object? propertyChanges = null,Object? proposedNTT = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,clockIn: null == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as String,clockOut: null == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as String,shiftTotalTime: null == shiftTotalTime ? _self.shiftTotalTime : shiftTotalTime // ignore: cast_nullable_to_non_nullable
as String,propertyChanges: null == propertyChanges ? _self.propertyChanges : propertyChanges // ignore: cast_nullable_to_non_nullable
as int,proposedNTT: null == proposedNTT ? _self.proposedNTT : proposedNTT // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskRow].
extension TaskRowPatterns on TaskRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskRow value)  $default,){
final _that = this;
switch (_that) {
case _TaskRow():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskRow value)?  $default,){
final _that = this;
switch (_that) {
case _TaskRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String date,  String clockIn,  String clockOut,  String shiftTotalTime,  int propertyChanges,  int proposedNTT)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskRow() when $default != null:
return $default(_that.name,_that.date,_that.clockIn,_that.clockOut,_that.shiftTotalTime,_that.propertyChanges,_that.proposedNTT);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String date,  String clockIn,  String clockOut,  String shiftTotalTime,  int propertyChanges,  int proposedNTT)  $default,) {final _that = this;
switch (_that) {
case _TaskRow():
return $default(_that.name,_that.date,_that.clockIn,_that.clockOut,_that.shiftTotalTime,_that.propertyChanges,_that.proposedNTT);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String date,  String clockIn,  String clockOut,  String shiftTotalTime,  int propertyChanges,  int proposedNTT)?  $default,) {final _that = this;
switch (_that) {
case _TaskRow() when $default != null:
return $default(_that.name,_that.date,_that.clockIn,_that.clockOut,_that.shiftTotalTime,_that.propertyChanges,_that.proposedNTT);case _:
  return null;

}
}

}

/// @nodoc


class _TaskRow implements TaskRow {
  const _TaskRow({required this.name, required this.date, required this.clockIn, required this.clockOut, required this.shiftTotalTime, required this.propertyChanges, required this.proposedNTT});
  

@override final  String name;
@override final  String date;
@override final  String clockIn;
@override final  String clockOut;
@override final  String shiftTotalTime;
@override final  int propertyChanges;
@override final  int proposedNTT;

/// Create a copy of TaskRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskRowCopyWith<_TaskRow> get copyWith => __$TaskRowCopyWithImpl<_TaskRow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskRow&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.shiftTotalTime, shiftTotalTime) || other.shiftTotalTime == shiftTotalTime)&&(identical(other.propertyChanges, propertyChanges) || other.propertyChanges == propertyChanges)&&(identical(other.proposedNTT, proposedNTT) || other.proposedNTT == proposedNTT));
}


@override
int get hashCode => Object.hash(runtimeType,name,date,clockIn,clockOut,shiftTotalTime,propertyChanges,proposedNTT);

@override
String toString() {
  return 'TaskRow(name: $name, date: $date, clockIn: $clockIn, clockOut: $clockOut, shiftTotalTime: $shiftTotalTime, propertyChanges: $propertyChanges, proposedNTT: $proposedNTT)';
}


}

/// @nodoc
abstract mixin class _$TaskRowCopyWith<$Res> implements $TaskRowCopyWith<$Res> {
  factory _$TaskRowCopyWith(_TaskRow value, $Res Function(_TaskRow) _then) = __$TaskRowCopyWithImpl;
@override @useResult
$Res call({
 String name, String date, String clockIn, String clockOut, String shiftTotalTime, int propertyChanges, int proposedNTT
});




}
/// @nodoc
class __$TaskRowCopyWithImpl<$Res>
    implements _$TaskRowCopyWith<$Res> {
  __$TaskRowCopyWithImpl(this._self, this._then);

  final _TaskRow _self;
  final $Res Function(_TaskRow) _then;

/// Create a copy of TaskRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? date = null,Object? clockIn = null,Object? clockOut = null,Object? shiftTotalTime = null,Object? propertyChanges = null,Object? proposedNTT = null,}) {
  return _then(_TaskRow(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,clockIn: null == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as String,clockOut: null == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as String,shiftTotalTime: null == shiftTotalTime ? _self.shiftTotalTime : shiftTotalTime // ignore: cast_nullable_to_non_nullable
as String,propertyChanges: null == propertyChanges ? _self.propertyChanges : propertyChanges // ignore: cast_nullable_to_non_nullable
as int,proposedNTT: null == proposedNTT ? _self.proposedNTT : proposedNTT // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
