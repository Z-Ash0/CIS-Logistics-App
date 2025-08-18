// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial<T> value) initial,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
          AuthState<T> value, $Res Function(AuthState<T>) then) =
      _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<T, $Res> {
  factory _$$AuthInitialImplCopyWith(_$AuthInitialImpl<T> value,
          $Res Function(_$AuthInitialImpl<T>) then) =
      __$$AuthInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthInitialImpl<T>>
    implements _$$AuthInitialImplCopyWith<T, $Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl<T> _value, $Res Function(_$AuthInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl<T> implements _AuthInitial<T> {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial<T> value) initial,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthInitial<T> implements AuthState<T> {
  const factory _AuthInitial() = _$AuthInitialImpl<T>;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<T, $Res> {
  factory _$$AuthLoadingImplCopyWith(_$AuthLoadingImpl<T> value,
          $Res Function(_$AuthLoadingImpl<T>) then) =
      __$$AuthLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthLoadingImpl<T>>
    implements _$$AuthLoadingImplCopyWith<T, $Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl<T> _value, $Res Function(_$AuthLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl<T> implements AuthLoading<T> {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial<T> value) initial,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading<T> implements AuthState<T> {
  const factory AuthLoading() = _$AuthLoadingImpl<T>;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<T, $Res> {
  factory _$$AuthSuccessImplCopyWith(_$AuthSuccessImpl<T> value,
          $Res Function(_$AuthSuccessImpl<T>) then) =
      __$$AuthSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthSuccessImpl<T>>
    implements _$$AuthSuccessImplCopyWith<T, $Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl<T> _value, $Res Function(_$AuthSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AuthSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AuthSuccessImpl<T> implements AuthSuccess<T> {
  const _$AuthSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AuthState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<T, _$AuthSuccessImpl<T>> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<T, _$AuthSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial<T> value) initial,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess<T> implements AuthState<T> {
  const factory AuthSuccess(final T data) = _$AuthSuccessImpl<T>;

  T get data;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSuccessImplCopyWith<T, _$AuthSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<T, $Res> {
  factory _$$AuthFailureImplCopyWith(_$AuthFailureImpl<T> value,
          $Res Function(_$AuthFailureImpl<T>) then) =
      __$$AuthFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthFailureImpl<T>>
    implements _$$AuthFailureImplCopyWith<T, $Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl<T> _value, $Res Function(_$AuthFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthFailureImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl<T> implements AuthFailure<T> {
  const _$AuthFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState<$T>.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<T, _$AuthFailureImpl<T>> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<T, _$AuthFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial<T> value) initial,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial<T> value)? initial,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial<T> value)? initial,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AuthFailure<T> implements AuthState<T> {
  const factory AuthFailure(final String message) = _$AuthFailureImpl<T>;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<T, _$AuthFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
