import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_states.freezed.dart';

@Freezed()
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.success(T data) = AuthSuccess<T>;
  const factory AuthState.failure(String message) = AuthFailure;
}
