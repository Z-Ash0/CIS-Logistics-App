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
import 'package:flutter/material.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

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
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(16),
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

                  verticalSpace(8),

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
                        verticalSpace(8),
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
                        verticalSpace(8),
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

                        CustomButton(
                          onPressed: () {
                            if (_resetPasswordFormKey.currentState
                                    ?.validate() ??
                                false) {
                              //TODO: Add backend logic here
                              context.navigateAndRemoveUntil(
                                Routes.passwordChangeSuccessScreen,
                              );
                            }
                          },
                          text: AppStrings.continueTxt,
                          style: AppTextStyles.bold16,
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
                        verticalSpace(16),
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
