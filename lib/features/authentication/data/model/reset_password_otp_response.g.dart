// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordOtpResponse _$ResetPasswordOtpResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordOtpResponse(
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$ResetPasswordOtpResponseToJson(
        ResetPasswordOtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
