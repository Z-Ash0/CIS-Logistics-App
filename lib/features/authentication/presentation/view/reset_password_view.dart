import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/app_validators.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/core/widgets/custom_text_field.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/reset_password_otp_bloc_consumer.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatefulWidget {
  final String email;
  final String otp;

  const ResetPasswordView({super.key, required this.email, required this.otp});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final GlobalKey<FormState> _resetPasswordFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  verticalSpaceScreen(context, 0.03),

                  Image.asset(
                    Assets.cisLogo,
                    height: context.setBasedOnScreenHeight(0.1),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    AppStrings.resetPassword,
                    style: AppTextStyles.bold24,
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: context.setBasedOnScreenHeight(0.035),
                    ),
                    child: Text(
                      AppStrings.newPasswordRules,
                      style: AppTextStyles.regular16,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    key: _resetPasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.password,
                          style: AppTextStyles.medium18,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _passController,
                          isObscured: true,
                          hintText: AppStrings.createNewPassword,
                          validator: AppValidators.newPasswordValidator,
                        ),

                        verticalSpaceScreen(context, 0.03),
                        Text(
                          AppStrings.confirmPassword,
                          style: AppTextStyles.medium18,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _confirmPassController,
                          isObscured: true,
                          hintText: AppStrings.confirmNewPassword,
                          validator: (value) =>
                              AppValidators.confirmPasswordValidator(
                                value,
                                _passController.text,
                              ),
                        ),
                        verticalSpaceScreen(context, 0.03),

                        ResetPasswordOtpBlocConsumer(
                          formKey: _resetPasswordFormKey,
                          email: widget.email,
                          getOtpCode: () => widget.otp,
                          passwordController: _passController,
                          confirmPasswordController: _confirmPassController,
                        ),
                        verticalSpaceScreen(context, 0.02),

                        CustomButton(
                          onPressed: () {
                            context.navigateAndRemoveUntil(Routes.signInScreen);
                          },
                          text: AppStrings.cancel,
                          style: AppTextStyles.bold16,
                          foregroundColor: AppColors.lightGreen,
                          backgroundColor: AppColors.white,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
