import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_validators.dart';
import 'package:cis_logistics_app/core/widgets/custom_text_field.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/text_field_required_header.dart';
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
            TextFieldRequiredHeader(AppStrings.emailAddress),
            const SizedBox(height: 8),
            CustomTextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: AppValidators.emailValidator,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Password field
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldRequiredHeader(AppStrings.password),
            const SizedBox(height: 8),
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
