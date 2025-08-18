import 'package:cis_logistics_app/core/newtorking/api_error_handler.dart';
import 'package:cis_logistics_app/core/newtorking/api_result.dart';
import 'package:cis_logistics_app/core/newtorking/api_service.dart';
import 'package:cis_logistics_app/features/scanner/data/models/scanner_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterEventRepository {
  final ApiService _apiService;
  RegisterEventRepository(this._apiService);

  Future<ApiResult<ScannerResponse>> registerEvent(String path) async {
    try {
      final secretValue = dotenv.env['SECRET_VALUE'];
      final response = await _apiService.qrRegister(
        path: path,
        secretValue: secretValue!,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.extractErrorMessage(e));
    }
  }
}
