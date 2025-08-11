import 'package:bloc/bloc.dart';
import 'package:cis_logistics_app/features/profile/data/model/reset_password_request.dart';
import 'package:cis_logistics_app/features/profile/data/repository/user_repository.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_states.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(const UserState.initial());
  final UserRepository _userRepository;
  bool firstTimeLoad = true;

  void loadUserData() {
    if (!firstTimeLoad) return;
    emit(const UserState.loading());
    _userRepository
        .getUserData()
        .then((result) {
          result.when(
            onSuccess: (data) {
              firstTimeLoad = false;
              emit(UserState.success(data));
            },
            onFailure: (message) {
              firstTimeLoad = false;
              emit(UserState.failure(message));
            },
          );
        })
        .catchError((error) {
          firstTimeLoad = false;
          emit(UserState.failure(error.toString()));
        });
  }

  void resetPassword({required ResetPasswordRequest resetPasswordRequest}) {
    emit(const UserState.loading());
    _userRepository
        .resetPassword(resetPasswordRequest: resetPasswordRequest)
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
