// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserState<T> {
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
    required TResult Function(_UserInitial<T> value) initial,
    required TResult Function(UserLoading<T> value) loading,
    required TResult Function(UserSuccess<T> value) success,
    required TResult Function(UserFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitial<T> value)? initial,
    TResult? Function(UserLoading<T> value)? loading,
    TResult? Function(UserSuccess<T> value)? success,
    TResult? Function(UserFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitial<T> value)? initial,
    TResult Function(UserLoading<T> value)? loading,
    TResult Function(UserSuccess<T> value)? success,
    TResult Function(UserFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<T, $Res> {
  factory $UserStateCopyWith(
          UserState<T> value, $Res Function(UserState<T>) then) =
      _$UserStateCopyWithImpl<T, $Res, UserState<T>>;
}

/// @nodoc
class _$UserStateCopyWithImpl<T, $Res, $Val extends UserState<T>>
    implements $UserStateCopyWith<T, $Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserInitialImplCopyWith<T, $Res> {
  factory _$$UserInitialImplCopyWith(_$UserInitialImpl<T> value,
          $Res Function(_$UserInitialImpl<T>) then) =
      __$$UserInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UserInitialImplCopyWithImpl<T, $Res>
    extends _$UserStateCopyWithImpl<T, $Res, _$UserInitialImpl<T>>
    implements _$$UserInitialImplCopyWith<T, $Res> {
  __$$UserInitialImplCopyWithImpl(
      _$UserInitialImpl<T> _value, $Res Function(_$UserInitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserInitialImpl<T> implements _UserInitial<T> {
  const _$UserInitialImpl();

  @override
  String toString() {
    return 'UserState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserInitialImpl<T>);
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
    required TResult Function(_UserInitial<T> value) initial,
    required TResult Function(UserLoading<T> value) loading,
    required TResult Function(UserSuccess<T> value) success,
    required TResult Function(UserFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitial<T> value)? initial,
    TResult? Function(UserLoading<T> value)? loading,
    TResult? Function(UserSuccess<T> value)? success,
    TResult? Function(UserFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitial<T> value)? initial,
    TResult Function(UserLoading<T> value)? loading,
    TResult Function(UserSuccess<T> value)? success,
    TResult Function(UserFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _UserInitial<T> implements UserState<T> {
  const factory _UserInitial() = _$UserInitialImpl<T>;
}

/// @nodoc
abstract class _$$UserLoadingImplCopyWith<T, $Res> {
  factory _$$UserLoadingImplCopyWith(_$UserLoadingImpl<T> value,
          $Res Function(_$UserLoadingImpl<T>) then) =
      __$$UserLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$UserLoadingImplCopyWithImpl<T, $Res>
    extends _$UserStateCopyWithImpl<T, $Res, _$UserLoadingImpl<T>>
    implements _$$UserLoadingImplCopyWith<T, $Res> {
  __$$UserLoadingImplCopyWithImpl(
      _$UserLoadingImpl<T> _value, $Res Function(_$UserLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserLoadingImpl<T> implements UserLoading<T> {
  const _$UserLoadingImpl();

  @override
  String toString() {
    return 'UserState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadingImpl<T>);
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
    required TResult Function(_UserInitial<T> value) initial,
    required TResult Function(UserLoading<T> value) loading,
    required TResult Function(UserSuccess<T> value) success,
    required TResult Function(UserFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitial<T> value)? initial,
    TResult? Function(UserLoading<T> value)? loading,
    TResult? Function(UserSuccess<T> value)? success,
    TResult? Function(UserFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitial<T> value)? initial,
    TResult Function(UserLoading<T> value)? loading,
    TResult Function(UserSuccess<T> value)? success,
    TResult Function(UserFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserLoading<T> implements UserState<T> {
  const factory UserLoading() = _$UserLoadingImpl<T>;
}

/// @nodoc
abstract class _$$UserSuccessImplCopyWith<T, $Res> {
  factory _$$UserSuccessImplCopyWith(_$UserSuccessImpl<T> value,
          $Res Function(_$UserSuccessImpl<T>) then) =
      __$$UserSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$UserSuccessImplCopyWithImpl<T, $Res>
    extends _$UserStateCopyWithImpl<T, $Res, _$UserSuccessImpl<T>>
    implements _$$UserSuccessImplCopyWith<T, $Res> {
  __$$UserSuccessImplCopyWithImpl(
      _$UserSuccessImpl<T> _value, $Res Function(_$UserSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$UserSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UserSuccessImpl<T> implements UserSuccess<T> {
  const _$UserSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'UserState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSuccessImplCopyWith<T, _$UserSuccessImpl<T>> get copyWith =>
      __$$UserSuccessImplCopyWithImpl<T, _$UserSuccessImpl<T>>(
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
    required TResult Function(_UserInitial<T> value) initial,
    required TResult Function(UserLoading<T> value) loading,
    required TResult Function(UserSuccess<T> value) success,
    required TResult Function(UserFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitial<T> value)? initial,
    TResult? Function(UserLoading<T> value)? loading,
    TResult? Function(UserSuccess<T> value)? success,
    TResult? Function(UserFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitial<T> value)? initial,
    TResult Function(UserLoading<T> value)? loading,
    TResult Function(UserSuccess<T> value)? success,
    TResult Function(UserFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UserSuccess<T> implements UserState<T> {
  const factory UserSuccess(final T data) = _$UserSuccessImpl<T>;

  T get data;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSuccessImplCopyWith<T, _$UserSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserFailureImplCopyWith<T, $Res> {
  factory _$$UserFailureImplCopyWith(_$UserFailureImpl<T> value,
          $Res Function(_$UserFailureImpl<T>) then) =
      __$$UserFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserFailureImplCopyWithImpl<T, $Res>
    extends _$UserStateCopyWithImpl<T, $Res, _$UserFailureImpl<T>>
    implements _$$UserFailureImplCopyWith<T, $Res> {
  __$$UserFailureImplCopyWithImpl(
      _$UserFailureImpl<T> _value, $Res Function(_$UserFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserFailureImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserFailureImpl<T> implements UserFailure<T> {
  const _$UserFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserState<$T>.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFailureImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFailureImplCopyWith<T, _$UserFailureImpl<T>> get copyWith =>
      __$$UserFailureImplCopyWithImpl<T, _$UserFailureImpl<T>>(
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
    required TResult Function(_UserInitial<T> value) initial,
    required TResult Function(UserLoading<T> value) loading,
    required TResult Function(UserSuccess<T> value) success,
    required TResult Function(UserFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UserInitial<T> value)? initial,
    TResult? Function(UserLoading<T> value)? loading,
    TResult? Function(UserSuccess<T> value)? success,
    TResult? Function(UserFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UserInitial<T> value)? initial,
    TResult Function(UserLoading<T> value)? loading,
    TResult Function(UserSuccess<T> value)? success,
    TResult Function(UserFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UserFailure<T> implements UserState<T> {
  const factory UserFailure(final String message) = _$UserFailureImpl<T>;

  String get message;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserFailureImplCopyWith<T, _$UserFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
