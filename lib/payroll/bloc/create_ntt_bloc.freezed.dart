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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateNttStarted value)?  started,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateNttStarted value)  started,}){
final _that = this;
switch (_that) {
case CreateNttStarted():
return started(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateNttStarted value)?  started,}){
final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,}) {final _that = this;
switch (_that) {
case CreateNttStarted():
return started();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,}) {final _that = this;
switch (_that) {
case CreateNttStarted() when started != null:
return started();case _:
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
mixin _$CreateNttState {

 CreateNttStatus get status;
/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNttStateCopyWith<CreateNttState> get copyWith => _$CreateNttStateCopyWithImpl<CreateNttState>(this as CreateNttState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNttState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'CreateNttState(status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateNttStateCopyWith<$Res>  {
  factory $CreateNttStateCopyWith(CreateNttState value, $Res Function(CreateNttState) _then) = _$CreateNttStateCopyWithImpl;
@useResult
$Res call({
 CreateNttStatus status
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
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateNttStatus,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateNttStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateNttStatus status)  $default,) {final _that = this;
switch (_that) {
case _CreateNttState():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateNttStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CreateNttState() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _CreateNttState implements CreateNttState {
  const _CreateNttState({this.status = CreateNttStatus.initial});
  

@override@JsonKey() final  CreateNttStatus status;

/// Create a copy of CreateNttState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNttStateCopyWith<_CreateNttState> get copyWith => __$CreateNttStateCopyWithImpl<_CreateNttState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNttState&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'CreateNttState(status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateNttStateCopyWith<$Res> implements $CreateNttStateCopyWith<$Res> {
  factory _$CreateNttStateCopyWith(_CreateNttState value, $Res Function(_CreateNttState) _then) = __$CreateNttStateCopyWithImpl;
@override @useResult
$Res call({
 CreateNttStatus status
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
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_CreateNttState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CreateNttStatus,
  ));
}


}

// dart format on
