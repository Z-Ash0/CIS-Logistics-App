import 'package:bloc/bloc.dart';
import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/reset_password_otp_request.dart';
import 'package:cis_logistics_app/features/authentication/data/repository/auth_repository.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthState.initial());

  Future<void> emitLoginStates({
    required LoginRequest loginRequest,
    required UserRole role,
  }) async {
    emit(AuthState.loading());
    final response = await authRepository.login(
      loginRequest: loginRequest,
      role: role,
    );
    response.when(
      onSuccess: (data) {
        emit(AuthState.success(data));
      },
      onFailure: (error) {
        emit(AuthState.failure(error));
      },
    );
  }

  Future<void> emitForgetPasswordStates({required String email}) async {
    emit(AuthState.loading());
    final response = await authRepository.sendOTP(email);
    response.when(
      onSuccess: (_) {
        emit(AuthState.success(null));
      },
      onFailure: (error) {
        emit(AuthState.failure(error));
      },
    );
  }

  Future<void> emitVerifyOtpStates({
    required String email,
    required String otp,
  }) async {
    emit(AuthState.loading());
    final response = await authRepository.verifyOtp(email: email, otp: otp);
    response.when(
      onSuccess: (data) {
        emit(AuthState.success(data));
      },
      onFailure: (error) {
        emit(AuthState.failure(error));
      },
    );
  }

  Future<void> emitResetPasswordWithOtpStates({
    required ResetPasswordOtpRequest resetPasswordOtpRequest,
  }) async {
    emit(AuthState.loading());
    final response = await authRepository.resetPasswordWithOtp(
      resetPasswordOtpRequest,
    );
    response.when(
      onSuccess: (data) {
        emit(AuthState.success(data));
      },
      onFailure: (error) {
        emit(AuthState.failure(error));
      },
    );
  }
}
