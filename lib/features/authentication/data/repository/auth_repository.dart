import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/newtorking/api_error_handler.dart';
import 'package:cis_logistics_app/core/newtorking/api_result.dart';
import 'package:cis_logistics_app/core/newtorking/api_service.dart';
import 'package:cis_logistics_app/core/services/hive_service.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_response.dart';

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

      getIt<HiveService>().setIsloggedInValue(true);
      getIt<HiveService>().setUserRoleValue(role.name);
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(e));
    }
  }
}
