import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  @JsonKey(name: 'old_password')
  final String oldPassword;

  @JsonKey(name: 'new_password')
  final String newPassword;

  @JsonKey(name: 'new_password_confirmation')
  final String newPasswordConfirmation;

  ResetPasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
