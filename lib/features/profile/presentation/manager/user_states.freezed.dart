// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState<$T>()';
}


}

/// @nodoc
class $UserStateCopyWith<T,$Res>  {
$UserStateCopyWith(UserState<T> _, $Res Function(UserState<T>) __);
}


/// Adds pattern-matching-related methods to [UserState].
extension UserStatePatterns<T> on UserState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _UserInitial<T> value)?  initial,TResult Function( UserLoading<T> value)?  loading,TResult Function( UserSuccess<T> value)?  success,TResult Function( UserFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInitial() when initial != null:
return initial(_that);case UserLoading() when loading != null:
return loading(_that);case UserSuccess() when success != null:
return success(_that);case UserFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _UserInitial<T> value)  initial,required TResult Function( UserLoading<T> value)  loading,required TResult Function( UserSuccess<T> value)  success,required TResult Function( UserFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case _UserInitial():
return initial(_that);case UserLoading():
return loading(_that);case UserSuccess():
return success(_that);case UserFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _UserInitial<T> value)?  initial,TResult? Function( UserLoading<T> value)?  loading,TResult? Function( UserSuccess<T> value)?  success,TResult? Function( UserFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case _UserInitial() when initial != null:
return initial(_that);case UserLoading() when loading != null:
return loading(_that);case UserSuccess() when success != null:
return success(_that);case UserFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInitial() when initial != null:
return initial();case UserLoading() when loading != null:
return loading();case UserSuccess() when success != null:
return success(_that.data);case UserFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _UserInitial():
return initial();case UserLoading():
return loading();case UserSuccess():
return success(_that.data);case UserFailure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _UserInitial() when initial != null:
return initial();case UserLoading() when loading != null:
return loading();case UserSuccess() when success != null:
return success(_that.data);case UserFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _UserInitial<T> implements UserState<T> {
  const _UserInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState<$T>.initial()';
}


}




/// @nodoc


class UserLoading<T> implements UserState<T> {
  const UserLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserState<$T>.loading()';
}


}




/// @nodoc


class UserSuccess<T> implements UserState<T> {
  const UserSuccess(this.data);
  

 final  T data;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSuccessCopyWith<T, UserSuccess<T>> get copyWith => _$UserSuccessCopyWithImpl<T, UserSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'UserState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSuccessCopyWith<T,$Res> implements $UserStateCopyWith<T, $Res> {
  factory $UserSuccessCopyWith(UserSuccess<T> value, $Res Function(UserSuccess<T>) _then) = _$UserSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$UserSuccessCopyWithImpl<T,$Res>
    implements $UserSuccessCopyWith<T, $Res> {
  _$UserSuccessCopyWithImpl(this._self, this._then);

  final UserSuccess<T> _self;
  final $Res Function(UserSuccess<T>) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(UserSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class UserFailure<T> implements UserState<T> {
  const UserFailure(this.message);
  

 final  String message;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFailureCopyWith<T, UserFailure<T>> get copyWith => _$UserFailureCopyWithImpl<T, UserFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFailure<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UserState<$T>.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UserFailureCopyWith<T,$Res> implements $UserStateCopyWith<T, $Res> {
  factory $UserFailureCopyWith(UserFailure<T> value, $Res Function(UserFailure<T>) _then) = _$UserFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UserFailureCopyWithImpl<T,$Res>
    implements $UserFailureCopyWith<T, $Res> {
  _$UserFailureCopyWithImpl(this._self, this._then);

  final UserFailure<T> _self;
  final $Res Function(UserFailure<T>) _then;

/// Create a copy of UserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UserFailure<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
