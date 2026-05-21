// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardEvent()';
}


}

/// @nodoc
class $DashboardEventCopyWith<$Res>  {
$DashboardEventCopyWith(DashboardEvent _, $Res Function(DashboardEvent) __);
}


/// Adds pattern-matching-related methods to [DashboardEvent].
extension DashboardEventPatterns on DashboardEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DashboardStarted value)?  started,TResult Function( DashboardMiniAppOpened value)?  miniAppOpened,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DashboardStarted() when started != null:
return started(_that);case DashboardMiniAppOpened() when miniAppOpened != null:
return miniAppOpened(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DashboardStarted value)  started,required TResult Function( DashboardMiniAppOpened value)  miniAppOpened,}){
final _that = this;
switch (_that) {
case DashboardStarted():
return started(_that);case DashboardMiniAppOpened():
return miniAppOpened(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DashboardStarted value)?  started,TResult? Function( DashboardMiniAppOpened value)?  miniAppOpened,}){
final _that = this;
switch (_that) {
case DashboardStarted() when started != null:
return started(_that);case DashboardMiniAppOpened() when miniAppOpened != null:
return miniAppOpened(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( MiniApp miniApp)?  miniAppOpened,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DashboardStarted() when started != null:
return started();case DashboardMiniAppOpened() when miniAppOpened != null:
return miniAppOpened(_that.miniApp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( MiniApp miniApp)  miniAppOpened,}) {final _that = this;
switch (_that) {
case DashboardStarted():
return started();case DashboardMiniAppOpened():
return miniAppOpened(_that.miniApp);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( MiniApp miniApp)?  miniAppOpened,}) {final _that = this;
switch (_that) {
case DashboardStarted() when started != null:
return started();case DashboardMiniAppOpened() when miniAppOpened != null:
return miniAppOpened(_that.miniApp);case _:
  return null;

}
}

}

/// @nodoc


class DashboardStarted implements DashboardEvent {
  const DashboardStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardEvent.started()';
}


}




/// @nodoc


class DashboardMiniAppOpened implements DashboardEvent {
  const DashboardMiniAppOpened(this.miniApp);
  

 final  MiniApp miniApp;

/// Create a copy of DashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardMiniAppOpenedCopyWith<DashboardMiniAppOpened> get copyWith => _$DashboardMiniAppOpenedCopyWithImpl<DashboardMiniAppOpened>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardMiniAppOpened&&(identical(other.miniApp, miniApp) || other.miniApp == miniApp));
}


@override
int get hashCode => Object.hash(runtimeType,miniApp);

@override
String toString() {
  return 'DashboardEvent.miniAppOpened(miniApp: $miniApp)';
}


}

/// @nodoc
abstract mixin class $DashboardMiniAppOpenedCopyWith<$Res> implements $DashboardEventCopyWith<$Res> {
  factory $DashboardMiniAppOpenedCopyWith(DashboardMiniAppOpened value, $Res Function(DashboardMiniAppOpened) _then) = _$DashboardMiniAppOpenedCopyWithImpl;
@useResult
$Res call({
 MiniApp miniApp
});




}
/// @nodoc
class _$DashboardMiniAppOpenedCopyWithImpl<$Res>
    implements $DashboardMiniAppOpenedCopyWith<$Res> {
  _$DashboardMiniAppOpenedCopyWithImpl(this._self, this._then);

  final DashboardMiniAppOpened _self;
  final $Res Function(DashboardMiniAppOpened) _then;

/// Create a copy of DashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? miniApp = null,}) {
  return _then(DashboardMiniAppOpened(
null == miniApp ? _self.miniApp : miniApp // ignore: cast_nullable_to_non_nullable
as MiniApp,
  ));
}


}

/// @nodoc
mixin _$DashboardState {

 List<MiniApp> get miniApps;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&const DeepCollectionEquality().equals(other.miniApps, miniApps));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(miniApps));

@override
String toString() {
  return 'DashboardState(miniApps: $miniApps)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 List<MiniApp> miniApps
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? miniApps = null,}) {
  return _then(_self.copyWith(
miniApps: null == miniApps ? _self.miniApps : miniApps // ignore: cast_nullable_to_non_nullable
as List<MiniApp>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MiniApp> miniApps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.miniApps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MiniApp> miniApps)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.miniApps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MiniApp> miniApps)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.miniApps);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({final  List<MiniApp> miniApps = const <MiniApp>[]}): _miniApps = miniApps;
  

 final  List<MiniApp> _miniApps;
@override@JsonKey() List<MiniApp> get miniApps {
  if (_miniApps is EqualUnmodifiableListView) return _miniApps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_miniApps);
}


/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&const DeepCollectionEquality().equals(other._miniApps, _miniApps));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_miniApps));

@override
String toString() {
  return 'DashboardState(miniApps: $miniApps)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 List<MiniApp> miniApps
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? miniApps = null,}) {
  return _then(_DashboardState(
miniApps: null == miniApps ? _self._miniApps : miniApps // ignore: cast_nullable_to_non_nullable
as List<MiniApp>,
  ));
}


}

// dart format on
