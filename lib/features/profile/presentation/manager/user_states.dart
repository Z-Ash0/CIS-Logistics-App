import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_states.freezed.dart';

@Freezed()
class UserState<T> with _$UserState<T> {
  const factory UserState.initial() = _UserInitial;
  const factory UserState.loading() = UserLoading;
  const factory UserState.success(T data) = UserSuccess<T>;
  const factory UserState.failure(String message) = UserFailure;
}
