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

 CreateNttStatus get status; String? get timeTrackingTaskFileName; String? get timeTrackingTaskFilePath; Uint8List? get timeTrackingTaskBytes;
/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNttStateCopyWith<CreateNttState> get copyWith => _$CreateNttStateCopyWithImpl<CreateNttState>(this as CreateNttState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNttState&&(identical(other.status, status) || other.status == status)&&(identical(other.timeTrackingTaskFileName, timeTrackingTaskFileName) || other.timeTrackingTaskFileName == timeTrackingTaskFileName)&&(identical(other.timeTrackingTaskFilePath, timeTrackingTaskFilePath) || other.timeTrackingTaskFilePath == timeTrackingTaskFilePath)&&const DeepCollectionEquality().equals(other.timeTrackingTaskBytes, timeTrackingTaskBytes));
}


@override
int get hashCode => Object.hash(runtimeType,status,timeTrackingTaskFileName,timeTrackingTaskFilePath,const DeepCollectionEquality().hash(timeTrackingTaskBytes));

@override
String toString() {
  return 'CreateNttState(status: $status, timeTrackingTaskFileName: $timeTrackingTaskFileName, timeTrackingTaskFilePath: $timeTrackingTaskFilePath, timeTrackingTaskBytes: $timeTrackingTaskBytes)';
}


}

/// @nodoc
abstract mixin class $CreateNttStateCopyWith<$Res>  {
  factory $CreateNttStateCopyWith(CreateNttState value, $Res Function(CreateNttState) _then) = _$CreateNttStateCopyWithImpl;
@useResult
$Res call({
 CreateNttStatus status, String? timeTrackingTaskFileName, String? timeTrackingTaskFilePath, Uint8List? timeTrackingTaskBytes
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? timeTrackingTaskFileName = freezed,Object? timeTrackingTaskFilePath = freezed,Object? timeTrackingTaskBytes = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateNttStatus,timeTrackingTaskFileName: freezed == timeTrackingTaskFileName ? _self.timeTrackingTaskFileName : timeTrackingTaskFileName // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskFilePath: freezed == timeTrackingTaskFilePath ? _self.timeTrackingTaskFilePath : timeTrackingTaskFilePath // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskBytes: freezed == timeTrackingTaskBytes ? _self.timeTrackingTaskBytes : timeTrackingTaskBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateNttStatus status,  String? timeTrackingTaskFileName,  String? timeTrackingTaskFilePath,  Uint8List? timeTrackingTaskBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
return $default(_that.status,_that.timeTrackingTaskFileName,_that.timeTrackingTaskFilePath,_that.timeTrackingTaskBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateNttStatus status,  String? timeTrackingTaskFileName,  String? timeTrackingTaskFilePath,  Uint8List? timeTrackingTaskBytes)  $default,) {final _that = this;
switch (_that) {
case _CreateNttState():
return $default(_that.status,_that.timeTrackingTaskFileName,_that.timeTrackingTaskFilePath,_that.timeTrackingTaskBytes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateNttStatus status,  String? timeTrackingTaskFileName,  String? timeTrackingTaskFilePath,  Uint8List? timeTrackingTaskBytes)?  $default,) {final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
return $default(_that.status,_that.timeTrackingTaskFileName,_that.timeTrackingTaskFilePath,_that.timeTrackingTaskBytes);case _:
  return null;

}
}

}

/// @nodoc


class _CreateNttState implements CreateNttState {
  const _CreateNttState({this.status = CreateNttStatus.initial, this.timeTrackingTaskFileName, this.timeTrackingTaskFilePath, this.timeTrackingTaskBytes});
  

@override@JsonKey() final  CreateNttStatus status;
@override final  String? timeTrackingTaskFileName;
@override final  String? timeTrackingTaskFilePath;
@override final  Uint8List? timeTrackingTaskBytes;

/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNttStateCopyWith<_CreateNttState> get copyWith => __$CreateNttStateCopyWithImpl<_CreateNttState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNttState&&(identical(other.status, status) || other.status == status)&&(identical(other.timeTrackingTaskFileName, timeTrackingTaskFileName) || other.timeTrackingTaskFileName == timeTrackingTaskFileName)&&(identical(other.timeTrackingTaskFilePath, timeTrackingTaskFilePath) || other.timeTrackingTaskFilePath == timeTrackingTaskFilePath)&&const DeepCollectionEquality().equals(other.timeTrackingTaskBytes, timeTrackingTaskBytes));
}


@override
int get hashCode => Object.hash(runtimeType,status,timeTrackingTaskFileName,timeTrackingTaskFilePath,const DeepCollectionEquality().hash(timeTrackingTaskBytes));

@override
String toString() {
  return 'CreateNttState(status: $status, timeTrackingTaskFileName: $timeTrackingTaskFileName, timeTrackingTaskFilePath: $timeTrackingTaskFilePath, timeTrackingTaskBytes: $timeTrackingTaskBytes)';
}


}

/// @nodoc
abstract mixin class _$CreateNttStateCopyWith<$Res> implements $CreateNttStateCopyWith<$Res> {
  factory _$CreateNttStateCopyWith(_CreateNttState value, $Res Function(_CreateNttState) _then) = __$CreateNttStateCopyWithImpl;
@override @useResult
$Res call({
 CreateNttStatus status, String? timeTrackingTaskFileName, String? timeTrackingTaskFilePath, Uint8List? timeTrackingTaskBytes
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? timeTrackingTaskFileName = freezed,Object? timeTrackingTaskFilePath = freezed,Object? timeTrackingTaskBytes = freezed,}) {
  return _then(_CreateNttState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateNttStatus,timeTrackingTaskFileName: freezed == timeTrackingTaskFileName ? _self.timeTrackingTaskFileName : timeTrackingTaskFileName // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskFilePath: freezed == timeTrackingTaskFilePath ? _self.timeTrackingTaskFilePath : timeTrackingTaskFilePath // ignore: cast_nullable_to_non_nullable
as String?,timeTrackingTaskBytes: freezed == timeTrackingTaskBytes ? _self.timeTrackingTaskBytes : timeTrackingTaskBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}


}

// dart format on
