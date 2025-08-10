import 'package:cis_logistics_app/core/newtorking/api_constants.dart';
import 'package:cis_logistics_app/features/authentication/data/model/forget_password_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_response.dart';
import 'package:cis_logistics_app/features/authentication/data/model/verify_otp_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/verify_otp_response.dart';
import 'package:cis_logistics_app/features/authentication/data/model/reset_password_otp_request.dart';
import 'package:cis_logistics_app/features/authentication/data/model/reset_password_otp_response.dart';
import 'package:cis_logistics_app/features/profile/data/model/user.dart';
import 'package:cis_logistics_app/features/profile/data/model/reset_password_request.dart';
import 'package:cis_logistics_app/features/profile/data/model/reset_password_response.dart';
import 'package:dio/dio.dart';
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

  @GET('{role}${EndPoints.profile}')
  Future<User> getUserData({@Path() required String role});

  @POST('{role}${EndPoints.forgetPassword}')
  Future<void> sendOTPCode({
    @Path() required String role,
    @Body() required ForgetPasswordRequest forgetPasswordRequest,
  });

  @POST('{role}${EndPoints.verifyOtp}')
  Future<VerifyOtpResponse> verifyOtp({
    @Path() required String role,
    @Body() required VerifyOtpRequest verifyOtpRequest,
  });

  @POST('{role}${EndPoints.resetPassword}')
  Future<ResetPasswordResponse> resetPassword({
    @Path() required String role,
    @Body() required ResetPasswordRequest resetPasswordRequest,
  });

  @POST('{role}${EndPoints.resetPasswordOtp}')
  Future<ResetPasswordOtpResponse> resetPasswordWithOtp({
    @Path() required String role,
    @Body() required ResetPasswordOtpRequest resetPasswordOtpRequest,
  });
}
