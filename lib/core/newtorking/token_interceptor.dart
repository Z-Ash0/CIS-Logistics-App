import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/newtorking/api_constants.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await getIt<StorageService>().getSecure(
      StorageServiceKeys.kAccessToken,
    );
    if (!token.isNullOrEmpty()) {
      options.headers[ApiConstants.authorization] =
          ApiConstants.bearerPrefix + token!;
    }
    super.onRequest(options, handler);
  }
}
