import 'package:json_annotation/json_annotation.dart';

part 'reset_password_otp_response.g.dart';

@JsonSerializable()
class ResetPasswordOtpResponse {
  final String message;
  final List<dynamic> data;

  ResetPasswordOtpResponse({required this.message, required this.data});

  factory ResetPasswordOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordOtpResponseToJson(this);
}
