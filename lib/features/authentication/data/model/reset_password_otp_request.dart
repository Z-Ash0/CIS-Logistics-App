import 'package:json_annotation/json_annotation.dart';

part 'reset_password_otp_request.g.dart';

@JsonSerializable()
class ResetPasswordOtpRequest {
  final String email;
  final String otp;
  final String password;

  ResetPasswordOtpRequest({
    required this.email,
    required this.otp,
    required this.password,
  });

  factory ResetPasswordOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordOtpRequestToJson(this);
}
