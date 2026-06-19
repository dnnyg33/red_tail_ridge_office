// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthLoginRequested value)?  loginRequested,TResult Function( AuthLoggedOut value)?  loggedOut,TResult Function( AuthSessionRenewed value)?  sessionRenewed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that);case AuthLoggedOut() when loggedOut != null:
return loggedOut(_that);case AuthSessionRenewed() when sessionRenewed != null:
return sessionRenewed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthLoginRequested value)  loginRequested,required TResult Function( AuthLoggedOut value)  loggedOut,required TResult Function( AuthSessionRenewed value)  sessionRenewed,}){
final _that = this;
switch (_that) {
case AuthLoginRequested():
return loginRequested(_that);case AuthLoggedOut():
return loggedOut(_that);case AuthSessionRenewed():
return sessionRenewed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthLoginRequested value)?  loginRequested,TResult? Function( AuthLoggedOut value)?  loggedOut,TResult? Function( AuthSessionRenewed value)?  sessionRenewed,}){
final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that);case AuthLoggedOut() when loggedOut != null:
return loggedOut(_that);case AuthSessionRenewed() when sessionRenewed != null:
return sessionRenewed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthProvider provider,  String clientId,  String clientSecret)?  loginRequested,TResult Function( AuthProvider provider)?  loggedOut,TResult Function( AuthSession session)?  sessionRenewed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that.provider,_that.clientId,_that.clientSecret);case AuthLoggedOut() when loggedOut != null:
return loggedOut(_that.provider);case AuthSessionRenewed() when sessionRenewed != null:
return sessionRenewed(_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthProvider provider,  String clientId,  String clientSecret)  loginRequested,required TResult Function( AuthProvider provider)  loggedOut,required TResult Function( AuthSession session)  sessionRenewed,}) {final _that = this;
switch (_that) {
case AuthLoginRequested():
return loginRequested(_that.provider,_that.clientId,_that.clientSecret);case AuthLoggedOut():
return loggedOut(_that.provider);case AuthSessionRenewed():
return sessionRenewed(_that.session);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthProvider provider,  String clientId,  String clientSecret)?  loginRequested,TResult? Function( AuthProvider provider)?  loggedOut,TResult? Function( AuthSession session)?  sessionRenewed,}) {final _that = this;
switch (_that) {
case AuthLoginRequested() when loginRequested != null:
return loginRequested(_that.provider,_that.clientId,_that.clientSecret);case AuthLoggedOut() when loggedOut != null:
return loggedOut(_that.provider);case AuthSessionRenewed() when sessionRenewed != null:
return sessionRenewed(_that.session);case _:
  return null;

}
}

}

/// @nodoc


class AuthLoginRequested implements AuthEvent {
  const AuthLoginRequested({required this.provider, required this.clientId, required this.clientSecret});
  

 final  AuthProvider provider;
 final  String clientId;
 final  String clientSecret;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoginRequestedCopyWith<AuthLoginRequested> get copyWith => _$AuthLoginRequestedCopyWithImpl<AuthLoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoginRequested&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientSecret, clientSecret) || other.clientSecret == clientSecret));
}


@override
int get hashCode => Object.hash(runtimeType,provider,clientId,clientSecret);

@override
String toString() {
  return 'AuthEvent.loginRequested(provider: $provider, clientId: $clientId, clientSecret: $clientSecret)';
}


}

/// @nodoc
abstract mixin class $AuthLoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoginRequestedCopyWith(AuthLoginRequested value, $Res Function(AuthLoginRequested) _then) = _$AuthLoginRequestedCopyWithImpl;
@useResult
$Res call({
 AuthProvider provider, String clientId, String clientSecret
});




}
/// @nodoc
class _$AuthLoginRequestedCopyWithImpl<$Res>
    implements $AuthLoginRequestedCopyWith<$Res> {
  _$AuthLoginRequestedCopyWithImpl(this._self, this._then);

  final AuthLoginRequested _self;
  final $Res Function(AuthLoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? clientId = null,Object? clientSecret = null,}) {
  return _then(AuthLoginRequested(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProvider,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientSecret: null == clientSecret ? _self.clientSecret : clientSecret // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthLoggedOut implements AuthEvent {
  const AuthLoggedOut(this.provider);
  

 final  AuthProvider provider;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthLoggedOutCopyWith<AuthLoggedOut> get copyWith => _$AuthLoggedOutCopyWithImpl<AuthLoggedOut>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoggedOut&&(identical(other.provider, provider) || other.provider == provider));
}


@override
int get hashCode => Object.hash(runtimeType,provider);

@override
String toString() {
  return 'AuthEvent.loggedOut(provider: $provider)';
}


}

/// @nodoc
abstract mixin class $AuthLoggedOutCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthLoggedOutCopyWith(AuthLoggedOut value, $Res Function(AuthLoggedOut) _then) = _$AuthLoggedOutCopyWithImpl;
@useResult
$Res call({
 AuthProvider provider
});




}
/// @nodoc
class _$AuthLoggedOutCopyWithImpl<$Res>
    implements $AuthLoggedOutCopyWith<$Res> {
  _$AuthLoggedOutCopyWithImpl(this._self, this._then);

  final AuthLoggedOut _self;
  final $Res Function(AuthLoggedOut) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provider = null,}) {
  return _then(AuthLoggedOut(
null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProvider,
  ));
}


}

/// @nodoc


class AuthSessionRenewed implements AuthEvent {
  const AuthSessionRenewed(this.session);
  

 final  AuthSession session;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionRenewedCopyWith<AuthSessionRenewed> get copyWith => _$AuthSessionRenewedCopyWithImpl<AuthSessionRenewed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionRenewed&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'AuthEvent.sessionRenewed(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthSessionRenewedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSessionRenewedCopyWith(AuthSessionRenewed value, $Res Function(AuthSessionRenewed) _then) = _$AuthSessionRenewedCopyWithImpl;
@useResult
$Res call({
 AuthSession session
});




}
/// @nodoc
class _$AuthSessionRenewedCopyWithImpl<$Res>
    implements $AuthSessionRenewedCopyWith<$Res> {
  _$AuthSessionRenewedCopyWithImpl(this._self, this._then);

  final AuthSessionRenewed _self;
  final $Res Function(AuthSessionRenewed) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthSessionRenewed(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession,
  ));
}


}

/// @nodoc
mixin _$AuthState {

/// Active connections keyed by provider.
 Map<AuthProvider, AuthSession> get sessions;/// Status of the in-flight login; success data is the provider connected.
 AsyncOperation<AuthProvider> get loginStatus;/// Provider currently being authenticated, if any.
 AuthProvider? get authenticatingProvider;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.loginStatus, loginStatus) || other.loginStatus == loginStatus)&&(identical(other.authenticatingProvider, authenticatingProvider) || other.authenticatingProvider == authenticatingProvider));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions),loginStatus,authenticatingProvider);

@override
String toString() {
  return 'AuthState(sessions: $sessions, loginStatus: $loginStatus, authenticatingProvider: $authenticatingProvider)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 Map<AuthProvider, AuthSession> sessions, AsyncOperation<AuthProvider> loginStatus, AuthProvider? authenticatingProvider
});


$AsyncOperationCopyWith<AuthProvider, $Res> get loginStatus;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,Object? loginStatus = null,Object? authenticatingProvider = freezed,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as Map<AuthProvider, AuthSession>,loginStatus: null == loginStatus ? _self.loginStatus : loginStatus // ignore: cast_nullable_to_non_nullable
as AsyncOperation<AuthProvider>,authenticatingProvider: freezed == authenticatingProvider ? _self.authenticatingProvider : authenticatingProvider // ignore: cast_nullable_to_non_nullable
as AuthProvider?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncOperationCopyWith<AuthProvider, $Res> get loginStatus {
  
  return $AsyncOperationCopyWith<AuthProvider, $Res>(_self.loginStatus, (value) {
    return _then(_self.copyWith(loginStatus: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<AuthProvider, AuthSession> sessions,  AsyncOperation<AuthProvider> loginStatus,  AuthProvider? authenticatingProvider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.sessions,_that.loginStatus,_that.authenticatingProvider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<AuthProvider, AuthSession> sessions,  AsyncOperation<AuthProvider> loginStatus,  AuthProvider? authenticatingProvider)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.sessions,_that.loginStatus,_that.authenticatingProvider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<AuthProvider, AuthSession> sessions,  AsyncOperation<AuthProvider> loginStatus,  AuthProvider? authenticatingProvider)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.sessions,_that.loginStatus,_that.authenticatingProvider);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState extends AuthState {
  const _AuthState({final  Map<AuthProvider, AuthSession> sessions = const <AuthProvider, AuthSession>{}, this.loginStatus = const AsyncOperation<AuthProvider>.idle(), this.authenticatingProvider}): _sessions = sessions,super._();
  

/// Active connections keyed by provider.
 final  Map<AuthProvider, AuthSession> _sessions;
/// Active connections keyed by provider.
@override@JsonKey() Map<AuthProvider, AuthSession> get sessions {
  if (_sessions is EqualUnmodifiableMapView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sessions);
}

/// Status of the in-flight login; success data is the provider connected.
@override@JsonKey() final  AsyncOperation<AuthProvider> loginStatus;
/// Provider currently being authenticated, if any.
@override final  AuthProvider? authenticatingProvider;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.loginStatus, loginStatus) || other.loginStatus == loginStatus)&&(identical(other.authenticatingProvider, authenticatingProvider) || other.authenticatingProvider == authenticatingProvider));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions),loginStatus,authenticatingProvider);

@override
String toString() {
  return 'AuthState(sessions: $sessions, loginStatus: $loginStatus, authenticatingProvider: $authenticatingProvider)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 Map<AuthProvider, AuthSession> sessions, AsyncOperation<AuthProvider> loginStatus, AuthProvider? authenticatingProvider
});


@override $AsyncOperationCopyWith<AuthProvider, $Res> get loginStatus;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,Object? loginStatus = null,Object? authenticatingProvider = freezed,}) {
  return _then(_AuthState(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as Map<AuthProvider, AuthSession>,loginStatus: null == loginStatus ? _self.loginStatus : loginStatus // ignore: cast_nullable_to_non_nullable
as AsyncOperation<AuthProvider>,authenticatingProvider: freezed == authenticatingProvider ? _self.authenticatingProvider : authenticatingProvider // ignore: cast_nullable_to_non_nullable
as AuthProvider?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AsyncOperationCopyWith<AuthProvider, $Res> get loginStatus {
  
  return $AsyncOperationCopyWith<AuthProvider, $Res>(_self.loginStatus, (value) {
    return _then(_self.copyWith(loginStatus: value));
  });
}
}

// dart format on
