import 'package:bloc/bloc.dart';
import 'package:cis_logistics_app/features/profile/data/repository/user_repository.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_states.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(const UserState.initial());
  final UserRepository _userRepository;

  void loadUserData() {
    emit(const UserState.loading());
    _userRepository
        .getUserData()
        .then((result) {
          result.when(
            onSuccess: (data) => emit(UserState.success(data)),
            onFailure: (message) => emit(UserState.failure(message)),
          );
        })
        .catchError((error) {
          emit(UserState.failure(error.toString()));
        });
  }

  void resetPassword({
    required String oldPassword,
    required String newPassword,
  }) {
    emit(const UserState.loading());
    _userRepository
        .resetPassword(oldPassword: oldPassword, newPassword: newPassword)
        .then((result) {
          result.when(
            onSuccess: (message) => emit(UserState.success(message)),
            onFailure: (errorMessage) => emit(UserState.failure(errorMessage)),
          );
        })
        .catchError((error) {
          emit(UserState.failure(error.toString()));
        });
  }
}
