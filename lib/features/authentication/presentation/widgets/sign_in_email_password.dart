import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/app_validators.dart';
import 'package:cis_logistics_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignInEmailPassword extends StatelessWidget {
  const SignInEmailPassword({
    super.key,
    required this.passController,
    required this.emailController,
  });
  final TextEditingController passController, emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textFieldRequiredHeader(AppStrings.emailAddress),
            verticalSpace(8),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: AppValidators.emailValidator,
            ),
          ],
        ),

        verticalSpace(24),

        // Password field
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textFieldRequiredHeader(AppStrings.password),
            verticalSpace(8),
            CustomTextField(
              isObscured: true,
              controller: passController,
              validator: AppValidators.passwordValidator,
            ),
          ],
        ),
      ],
    );
  }
}

RichText _textFieldRequiredHeader(String text) {
  return RichText(
    text: TextSpan(
      text: text,
      style: AppTextStyles.medium16.copyWith(color: AppColors.darkerGreen),
      children: [
        TextSpan(
          text: ' *',
          style: TextStyle(fontSize: 14, color: AppColors.lighterRed),
        ),
      ],
    ),
  );
}
