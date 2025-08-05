import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/app_validators.dart';
import 'package:cis_logistics_app/features/profile/presentation/widgets/user_text_field.dart';
import 'package:cis_logistics_app/features/profile/presentation/widgets/reset_password_bloc_consumer.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          AppStrings.changePassword,
          style: AppTextStyles.bold24,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        maintainBottomViewPadding: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      UserTextField(
                        controller: _currentPasswordController,
                        labelText: AppStrings.currentPassword,
                        validator: AppValidators.passwordValidator,
                        isPassword: true,
                      ),

                      verticalSpace(24),

                      // New Password Field
                      UserTextField(
                        controller: _newPasswordController,
                        labelText: AppStrings.newPassword,
                        validator: AppValidators.newPasswordValidator,
                        isPassword: true,
                      ),
                      verticalSpace(24),

                      // Confirm Password Field
                      UserTextField(
                        controller: _confirmPasswordController,
                        labelText: AppStrings.confirmPassword,
                        validator: (value) =>
                            AppValidators.confirmPasswordValidator(
                              value,
                              _newPasswordController.text,
                            ),
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                // Update Password Button
                ResetPasswordBlocConsumer(
                  oldPassword: _currentPasswordController.text,
                  newPassword: _newPasswordController.text,
                  isFormValid: formKey.currentState?.validate() ?? false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
