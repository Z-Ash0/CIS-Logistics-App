// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordOtpRequest _$ResetPasswordOtpRequestFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordOtpRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$ResetPasswordOtpRequestToJson(
        ResetPasswordOtpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
