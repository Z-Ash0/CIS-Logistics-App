import 'package:cis_logistics_app/core/newtorking/api_constants.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('{role}${EndPoints.login}')
  Future<LoginResponse> login({
    @Path() required String role,
    @Body() required LoginRequest loginRequest,
  });
}
