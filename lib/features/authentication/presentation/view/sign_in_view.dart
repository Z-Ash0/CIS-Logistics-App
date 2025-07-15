import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/services/hive_service.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/sign_in_email_password.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            child: Column(
              children: [
                verticalSpace(context.setBasedOnScreenHeight(0.07)),

                Image.asset(
                  Assets.cisLogo,
                  height: context.setBasedOnScreenHeight(0.1),
                ),
                verticalSpace(8),
                const Text(AppStrings.signIn, style: AppTextStyles.bold24),

                verticalSpace(context.setBasedOnScreenHeight(0.07)),

                Form(
                  key: _signInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignInEmailPassword(
                        passController: _passwordController,
                        emailController: _emailController,
                      ),
                      verticalSpace(24),

                      _rememberMeAndForgetPasswordSection(),
                      verticalSpace(context.setBasedOnScreenHeight(0.05)),

                      CustomButton(
                        onPressed: () {
                          if (_signInFormKey.currentState?.validate() ??
                              false) {
                            //TODO: Add backend logic here
                            HiveService.isLoggedIn.put(
                              HiveKeys.kIsLoggedIn,
                              true,
                            );
                            context.navigateAndRemoveUntil(
                              Routes.mainPageScreen,
                            );
                          }
                        },
                        text: AppStrings.signIn,
                        style: AppTextStyles.bold16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rememberMeAndForgetPasswordSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                activeColor: AppColors.lightGreen,
                side: const BorderSide(color: AppColors.lightGreen, width: 2),
              ),
            ),
            horizontalSpace(8),
            Text(
              AppStrings.rememberMeLabel,
              style: AppTextStyles.bold12.copyWith(
                color: AppColors.darkerGreen,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () => context.navigateTo(Routes.forgotPasswordScreen),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            AppStrings.forgetPasswordQuestion,
            style: AppTextStyles.bold12.copyWith(color: AppColors.lightGreen),
          ),
        ),
      ],
    );
  }
}
