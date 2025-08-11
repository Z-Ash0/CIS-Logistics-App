import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/newtorking/api_error_handler.dart';
import 'package:cis_logistics_app/core/newtorking/api_result.dart';
import 'package:cis_logistics_app/core/newtorking/api_service.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/features/profile/data/model/user.dart';
import 'package:cis_logistics_app/features/profile/data/model/reset_password_request.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<ApiResult<UserData>> getUserData() async {
    try {
      UserData? userData = getIt<StorageService>().getUserData();
      if (userData != null) {
        return ApiResult.success(userData);
      }

      final String? userRole = getIt<StorageService>().userRole;
      if (userRole == null) {
        return ApiResult.failure("User not logged in");
      }

      final userResponse = await _apiService.getUserData(role: userRole);
      userData = userResponse.data;
      await getIt<StorageService>().saveUserData(userData);
      return ApiResult.success(userData);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(error));
    }
  }

  Future<ApiResult<String>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  }) async {
    try {
      final String? userRole = getIt<StorageService>().userRole;
      if (userRole == null) {
        return ApiResult.failure("User not logged in");
      }

      final response = await _apiService.resetPassword(
        role: userRole,
        resetPasswordRequest: resetPasswordRequest,
      );

      return ApiResult.success(response.message);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(error));
    }
  }
}
