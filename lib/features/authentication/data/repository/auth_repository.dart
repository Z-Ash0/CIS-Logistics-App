import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/newtorking/api_error_handler.dart';
import 'package:cis_logistics_app/core/newtorking/api_result.dart';
import 'package:cis_logistics_app/core/newtorking/api_service.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/features/authentication/data/model/forget_password_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_response.dart';
import 'package:cis_logistics_app/features/authentication/data/model/verify_otp_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/verify_otp_response.dart';
import 'package:cis_logistics_app/features/authentication/data/model/reset_password_otp_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/reset_password_otp_response.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<ApiResult<LoginResponse>> login({
    required LoginRequest loginRequest,
    required UserRole role,
  }) async {
    try {
      final response = await apiService.login(
        loginRequest: loginRequest,
        role: role.endpoint,
      );
      getIt<StorageService>().putSecure(
        StorageServiceKeys.kAccessToken,
        response.token,
      );
      getIt<StorageService>().setIsloggedInValue(true);
      getIt<StorageService>().setUserRoleValue(role);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(e));
    }
  }

  Future<ApiResult<void>> sendOTP(
    String email, {
    required UserRole role,
  }) async {
    try {
      await apiService.sendOTPCode(
        forgetPasswordRequest: ForgetPasswordRequest(email: email),
        role: role.endpoint,
      );
      getIt<StorageService>().setUserRoleValue(role);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(e));
    }
  }

  Future<ApiResult<VerifyOtpResponse>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final userRole = getIt<StorageService>().userRole?.endpoint;
      if (userRole == null) {
        return ApiResult.failure("User role is not identified");
      }
      final response = await apiService.verifyOtp(
        verifyOtpRequest: VerifyOtpRequest(email: email, otp: otp),
        role: userRole,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(e));
    }
  }

  Future<ApiResult<ResetPasswordOtpResponse>> resetPasswordWithOtp(
    ResetPasswordOtpRequest resetPasswordOtpRequest,
  ) async {
    try {
      final userRole = getIt<StorageService>().userRole?.endpoint;
      if (userRole == null) {
        return ApiResult.failure("User role is not identified");
      }
      final response = await apiService.resetPasswordWithOtp(
        resetPasswordOtpRequest: resetPasswordOtpRequest,
        role: userRole,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(e));
    }
  }
}
