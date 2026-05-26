// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_ntt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkerNtt {

 String get workerName; List<ProposedNttRow> get nttRows; double get totalNtt;
/// Create a copy of WorkerNtt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkerNttCopyWith<WorkerNtt> get copyWith => _$WorkerNttCopyWithImpl<WorkerNtt>(this as WorkerNtt, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkerNtt&&(identical(other.workerName, workerName) || other.workerName == workerName)&&const DeepCollectionEquality().equals(other.nttRows, nttRows)&&(identical(other.totalNtt, totalNtt) || other.totalNtt == totalNtt));
}


@override
int get hashCode => Object.hash(runtimeType,workerName,const DeepCollectionEquality().hash(nttRows),totalNtt);

@override
String toString() {
  return 'WorkerNtt(workerName: $workerName, nttRows: $nttRows, totalNtt: $totalNtt)';
}


}

/// @nodoc
abstract mixin class $WorkerNttCopyWith<$Res>  {
  factory $WorkerNttCopyWith(WorkerNtt value, $Res Function(WorkerNtt) _then) = _$WorkerNttCopyWithImpl;
@useResult
$Res call({
 String workerName, List<ProposedNttRow> nttRows, double totalNtt
});




}
/// @nodoc
class _$WorkerNttCopyWithImpl<$Res>
    implements $WorkerNttCopyWith<$Res> {
  _$WorkerNttCopyWithImpl(this._self, this._then);

  final WorkerNtt _self;
  final $Res Function(WorkerNtt) _then;

/// Create a copy of WorkerNtt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workerName = null,Object? nttRows = null,Object? totalNtt = null,}) {
  return _then(_self.copyWith(
workerName: null == workerName ? _self.workerName : workerName // ignore: cast_nullable_to_non_nullable
as String,nttRows: null == nttRows ? _self.nttRows : nttRows // ignore: cast_nullable_to_non_nullable
as List<ProposedNttRow>,totalNtt: null == totalNtt ? _self.totalNtt : totalNtt // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkerNtt].
extension WorkerNttPatterns on WorkerNtt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkerNtt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkerNtt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkerNtt value)  $default,){
final _that = this;
switch (_that) {
case _WorkerNtt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkerNtt value)?  $default,){
final _that = this;
switch (_that) {
case _WorkerNtt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workerName,  List<ProposedNttRow> nttRows,  double totalNtt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkerNtt() when $default != null:
return $default(_that.workerName,_that.nttRows,_that.totalNtt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workerName,  List<ProposedNttRow> nttRows,  double totalNtt)  $default,) {final _that = this;
switch (_that) {
case _WorkerNtt():
return $default(_that.workerName,_that.nttRows,_that.totalNtt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workerName,  List<ProposedNttRow> nttRows,  double totalNtt)?  $default,) {final _that = this;
switch (_that) {
case _WorkerNtt() when $default != null:
return $default(_that.workerName,_that.nttRows,_that.totalNtt);case _:
  return null;

}
}

}

/// @nodoc


class _WorkerNtt implements WorkerNtt {
  const _WorkerNtt({required this.workerName, required final  List<ProposedNttRow> nttRows, required this.totalNtt}): _nttRows = nttRows;
  

@override final  String workerName;
 final  List<ProposedNttRow> _nttRows;
@override List<ProposedNttRow> get nttRows {
  if (_nttRows is EqualUnmodifiableListView) return _nttRows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nttRows);
}

@override final  double totalNtt;

/// Create a copy of WorkerNtt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkerNttCopyWith<_WorkerNtt> get copyWith => __$WorkerNttCopyWithImpl<_WorkerNtt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkerNtt&&(identical(other.workerName, workerName) || other.workerName == workerName)&&const DeepCollectionEquality().equals(other._nttRows, _nttRows)&&(identical(other.totalNtt, totalNtt) || other.totalNtt == totalNtt));
}


@override
int get hashCode => Object.hash(runtimeType,workerName,const DeepCollectionEquality().hash(_nttRows),totalNtt);

@override
String toString() {
  return 'WorkerNtt(workerName: $workerName, nttRows: $nttRows, totalNtt: $totalNtt)';
}


}

/// @nodoc
abstract mixin class _$WorkerNttCopyWith<$Res> implements $WorkerNttCopyWith<$Res> {
  factory _$WorkerNttCopyWith(_WorkerNtt value, $Res Function(_WorkerNtt) _then) = __$WorkerNttCopyWithImpl;
@override @useResult
$Res call({
 String workerName, List<ProposedNttRow> nttRows, double totalNtt
});




}
/// @nodoc
class __$WorkerNttCopyWithImpl<$Res>
    implements _$WorkerNttCopyWith<$Res> {
  __$WorkerNttCopyWithImpl(this._self, this._then);

  final _WorkerNtt _self;
  final $Res Function(_WorkerNtt) _then;

/// Create a copy of WorkerNtt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workerName = null,Object? nttRows = null,Object? totalNtt = null,}) {
  return _then(_WorkerNtt(
workerName: null == workerName ? _self.workerName : workerName // ignore: cast_nullable_to_non_nullable
as String,nttRows: null == nttRows ? _self._nttRows : nttRows // ignore: cast_nullable_to_non_nullable
as List<ProposedNttRow>,totalNtt: null == totalNtt ? _self.totalNtt : totalNtt // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ProposedNttRow {

 String get date; String get shiftTotalTime; String get tasksTotalTime; int get properties; int get proposedNTT; TimePair get shift; TimePair get tasks; List<String> get inadvertentProperties; String get math;
/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposedNttRowCopyWith<ProposedNttRow> get copyWith => _$ProposedNttRowCopyWithImpl<ProposedNttRow>(this as ProposedNttRow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposedNttRow&&(identical(other.date, date) || other.date == date)&&(identical(other.shiftTotalTime, shiftTotalTime) || other.shiftTotalTime == shiftTotalTime)&&(identical(other.tasksTotalTime, tasksTotalTime) || other.tasksTotalTime == tasksTotalTime)&&(identical(other.properties, properties) || other.properties == properties)&&(identical(other.proposedNTT, proposedNTT) || other.proposedNTT == proposedNTT)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.tasks, tasks) || other.tasks == tasks)&&const DeepCollectionEquality().equals(other.inadvertentProperties, inadvertentProperties)&&(identical(other.math, math) || other.math == math));
}


@override
int get hashCode => Object.hash(runtimeType,date,shiftTotalTime,tasksTotalTime,properties,proposedNTT,shift,tasks,const DeepCollectionEquality().hash(inadvertentProperties),math);

@override
String toString() {
  return 'ProposedNttRow(date: $date, shiftTotalTime: $shiftTotalTime, tasksTotalTime: $tasksTotalTime, properties: $properties, proposedNTT: $proposedNTT, shift: $shift, tasks: $tasks, inadvertentProperties: $inadvertentProperties, math: $math)';
}


}

/// @nodoc
abstract mixin class $ProposedNttRowCopyWith<$Res>  {
  factory $ProposedNttRowCopyWith(ProposedNttRow value, $Res Function(ProposedNttRow) _then) = _$ProposedNttRowCopyWithImpl;
@useResult
$Res call({
 String date, String shiftTotalTime, String tasksTotalTime, int properties, int proposedNTT, TimePair shift, TimePair tasks, List<String> inadvertentProperties, String math
});


$TimePairCopyWith<$Res> get shift;$TimePairCopyWith<$Res> get tasks;

}
/// @nodoc
class _$ProposedNttRowCopyWithImpl<$Res>
    implements $ProposedNttRowCopyWith<$Res> {
  _$ProposedNttRowCopyWithImpl(this._self, this._then);

  final ProposedNttRow _self;
  final $Res Function(ProposedNttRow) _then;

/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? shiftTotalTime = null,Object? tasksTotalTime = null,Object? properties = null,Object? proposedNTT = null,Object? shift = null,Object? tasks = null,Object? inadvertentProperties = null,Object? math = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,shiftTotalTime: null == shiftTotalTime ? _self.shiftTotalTime : shiftTotalTime // ignore: cast_nullable_to_non_nullable
as String,tasksTotalTime: null == tasksTotalTime ? _self.tasksTotalTime : tasksTotalTime // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as int,proposedNTT: null == proposedNTT ? _self.proposedNTT : proposedNTT // ignore: cast_nullable_to_non_nullable
as int,shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as TimePair,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as TimePair,inadvertentProperties: null == inadvertentProperties ? _self.inadvertentProperties : inadvertentProperties // ignore: cast_nullable_to_non_nullable
as List<String>,math: null == math ? _self.math : math // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimePairCopyWith<$Res> get shift {
  
  return $TimePairCopyWith<$Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimePairCopyWith<$Res> get tasks {
  
  return $TimePairCopyWith<$Res>(_self.tasks, (value) {
    return _then(_self.copyWith(tasks: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProposedNttRow].
extension ProposedNttRowPatterns on ProposedNttRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProposedNttRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProposedNttRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProposedNttRow value)  $default,){
final _that = this;
switch (_that) {
case _ProposedNttRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProposedNttRow value)?  $default,){
final _that = this;
switch (_that) {
case _ProposedNttRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String shiftTotalTime,  String tasksTotalTime,  int properties,  int proposedNTT,  TimePair shift,  TimePair tasks,  List<String> inadvertentProperties,  String math)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProposedNttRow() when $default != null:
return $default(_that.date,_that.shiftTotalTime,_that.tasksTotalTime,_that.properties,_that.proposedNTT,_that.shift,_that.tasks,_that.inadvertentProperties,_that.math);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String shiftTotalTime,  String tasksTotalTime,  int properties,  int proposedNTT,  TimePair shift,  TimePair tasks,  List<String> inadvertentProperties,  String math)  $default,) {final _that = this;
switch (_that) {
case _ProposedNttRow():
return $default(_that.date,_that.shiftTotalTime,_that.tasksTotalTime,_that.properties,_that.proposedNTT,_that.shift,_that.tasks,_that.inadvertentProperties,_that.math);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String shiftTotalTime,  String tasksTotalTime,  int properties,  int proposedNTT,  TimePair shift,  TimePair tasks,  List<String> inadvertentProperties,  String math)?  $default,) {final _that = this;
switch (_that) {
case _ProposedNttRow() when $default != null:
return $default(_that.date,_that.shiftTotalTime,_that.tasksTotalTime,_that.properties,_that.proposedNTT,_that.shift,_that.tasks,_that.inadvertentProperties,_that.math);case _:
  return null;

}
}

}

/// @nodoc


class _ProposedNttRow implements ProposedNttRow {
  const _ProposedNttRow({required this.date, required this.shiftTotalTime, required this.tasksTotalTime, required this.properties, required this.proposedNTT, required this.shift, required this.tasks, final  List<String> inadvertentProperties = const <String>[], this.math = ''}): _inadvertentProperties = inadvertentProperties;
  

@override final  String date;
@override final  String shiftTotalTime;
@override final  String tasksTotalTime;
@override final  int properties;
@override final  int proposedNTT;
@override final  TimePair shift;
@override final  TimePair tasks;
 final  List<String> _inadvertentProperties;
@override@JsonKey() List<String> get inadvertentProperties {
  if (_inadvertentProperties is EqualUnmodifiableListView) return _inadvertentProperties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inadvertentProperties);
}

@override@JsonKey() final  String math;

/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProposedNttRowCopyWith<_ProposedNttRow> get copyWith => __$ProposedNttRowCopyWithImpl<_ProposedNttRow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProposedNttRow&&(identical(other.date, date) || other.date == date)&&(identical(other.shiftTotalTime, shiftTotalTime) || other.shiftTotalTime == shiftTotalTime)&&(identical(other.tasksTotalTime, tasksTotalTime) || other.tasksTotalTime == tasksTotalTime)&&(identical(other.properties, properties) || other.properties == properties)&&(identical(other.proposedNTT, proposedNTT) || other.proposedNTT == proposedNTT)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.tasks, tasks) || other.tasks == tasks)&&const DeepCollectionEquality().equals(other._inadvertentProperties, _inadvertentProperties)&&(identical(other.math, math) || other.math == math));
}


@override
int get hashCode => Object.hash(runtimeType,date,shiftTotalTime,tasksTotalTime,properties,proposedNTT,shift,tasks,const DeepCollectionEquality().hash(_inadvertentProperties),math);

@override
String toString() {
  return 'ProposedNttRow(date: $date, shiftTotalTime: $shiftTotalTime, tasksTotalTime: $tasksTotalTime, properties: $properties, proposedNTT: $proposedNTT, shift: $shift, tasks: $tasks, inadvertentProperties: $inadvertentProperties, math: $math)';
}


}

/// @nodoc
abstract mixin class _$ProposedNttRowCopyWith<$Res> implements $ProposedNttRowCopyWith<$Res> {
  factory _$ProposedNttRowCopyWith(_ProposedNttRow value, $Res Function(_ProposedNttRow) _then) = __$ProposedNttRowCopyWithImpl;
@override @useResult
$Res call({
 String date, String shiftTotalTime, String tasksTotalTime, int properties, int proposedNTT, TimePair shift, TimePair tasks, List<String> inadvertentProperties, String math
});


@override $TimePairCopyWith<$Res> get shift;@override $TimePairCopyWith<$Res> get tasks;

}
/// @nodoc
class __$ProposedNttRowCopyWithImpl<$Res>
    implements _$ProposedNttRowCopyWith<$Res> {
  __$ProposedNttRowCopyWithImpl(this._self, this._then);

  final _ProposedNttRow _self;
  final $Res Function(_ProposedNttRow) _then;

/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? shiftTotalTime = null,Object? tasksTotalTime = null,Object? properties = null,Object? proposedNTT = null,Object? shift = null,Object? tasks = null,Object? inadvertentProperties = null,Object? math = null,}) {
  return _then(_ProposedNttRow(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,shiftTotalTime: null == shiftTotalTime ? _self.shiftTotalTime : shiftTotalTime // ignore: cast_nullable_to_non_nullable
as String,tasksTotalTime: null == tasksTotalTime ? _self.tasksTotalTime : tasksTotalTime // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as int,proposedNTT: null == proposedNTT ? _self.proposedNTT : proposedNTT // ignore: cast_nullable_to_non_nullable
as int,shift: null == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as TimePair,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as TimePair,inadvertentProperties: null == inadvertentProperties ? _self._inadvertentProperties : inadvertentProperties // ignore: cast_nullable_to_non_nullable
as List<String>,math: null == math ? _self.math : math // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimePairCopyWith<$Res> get shift {
  
  return $TimePairCopyWith<$Res>(_self.shift, (value) {
    return _then(_self.copyWith(shift: value));
  });
}/// Create a copy of ProposedNttRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimePairCopyWith<$Res> get tasks {
  
  return $TimePairCopyWith<$Res>(_self.tasks, (value) {
    return _then(_self.copyWith(tasks: value));
  });
}
}

/// @nodoc
mixin _$TimePair {

 String get first; String get last;
/// Create a copy of TimePair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimePairCopyWith<TimePair> get copyWith => _$TimePairCopyWithImpl<TimePair>(this as TimePair, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimePair&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}


@override
int get hashCode => Object.hash(runtimeType,first,last);

@override
String toString() {
  return 'TimePair(first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class $TimePairCopyWith<$Res>  {
  factory $TimePairCopyWith(TimePair value, $Res Function(TimePair) _then) = _$TimePairCopyWithImpl;
@useResult
$Res call({
 String first, String last
});




}
/// @nodoc
class _$TimePairCopyWithImpl<$Res>
    implements $TimePairCopyWith<$Res> {
  _$TimePairCopyWithImpl(this._self, this._then);

  final TimePair _self;
  final $Res Function(TimePair) _then;

/// Create a copy of TimePair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = null,Object? last = null,}) {
  return _then(_self.copyWith(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TimePair].
extension TimePairPatterns on TimePair {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimePair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimePair() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimePair value)  $default,){
final _that = this;
switch (_that) {
case _TimePair():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimePair value)?  $default,){
final _that = this;
switch (_that) {
case _TimePair() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String first,  String last)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimePair() when $default != null:
return $default(_that.first,_that.last);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String first,  String last)  $default,) {final _that = this;
switch (_that) {
case _TimePair():
return $default(_that.first,_that.last);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String first,  String last)?  $default,) {final _that = this;
switch (_that) {
case _TimePair() when $default != null:
return $default(_that.first,_that.last);case _:
  return null;

}
}

}

/// @nodoc


class _TimePair implements TimePair {
  const _TimePair({required this.first, required this.last});
  

@override final  String first;
@override final  String last;

/// Create a copy of TimePair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimePairCopyWith<_TimePair> get copyWith => __$TimePairCopyWithImpl<_TimePair>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimePair&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last));
}


@override
int get hashCode => Object.hash(runtimeType,first,last);

@override
String toString() {
  return 'TimePair(first: $first, last: $last)';
}


}

/// @nodoc
abstract mixin class _$TimePairCopyWith<$Res> implements $TimePairCopyWith<$Res> {
  factory _$TimePairCopyWith(_TimePair value, $Res Function(_TimePair) _then) = __$TimePairCopyWithImpl;
@override @useResult
$Res call({
 String first, String last
});




}
/// @nodoc
class __$TimePairCopyWithImpl<$Res>
    implements _$TimePairCopyWith<$Res> {
  __$TimePairCopyWithImpl(this._self, this._then);

  final _TimePair _self;
  final $Res Function(_TimePair) _then;

/// Create a copy of TimePair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? last = null,}) {
  return _then(_TimePair(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as String,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
