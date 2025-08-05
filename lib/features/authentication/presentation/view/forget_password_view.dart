import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/app_validators.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/core/widgets/custom_text_field.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
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

                verticalSpaceScreen(context, 0.07),

                Image.asset(
                  Assets.cisLogo,
                  height: context.setBasedOnScreenHeight(0.1),
                ),

                verticalSpace(8),

                const Text(
                  AppStrings.forgetPassword,
                  style: AppTextStyles.bold24,
                ),

                verticalSpaceScreen(context, 0.05),

                Form(
                  key: _forgetPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textFieldRequiredHeader(AppStrings.emailAddress),
                      verticalSpace(8),
                      CustomTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.emailValidator,
                      ),
                      verticalSpaceScreen(context, 0.05),

                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return CustomButton(
                            onPressed: () {
                              if (_forgetPasswordFormKey.currentState
                                      ?.validate() ??
                                  false) {
                                context
                                    .read<AuthCubit>()
                                    .emitForgetPasswordStates(
                                      email: _emailController.text,
                                    );
                              }
                              state.whenOrNull(
                                success: (_) {
                                  _emailController.clear();
                                  context.navigateTo(
                                    Routes.confirmationCodeScreen,
                                  );
                                },
                                failure: (message) {
                                  FlushBarUtils.flushBarError(message, context);
                                },
                              );
                            },
                            text: AppStrings.send,
                            style: AppTextStyles.bold16,
                            child: state.whenOrNull(
                              loading: () => Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          );
                        },
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
}

RichText _textFieldRequiredHeader(String text) {
  return RichText(
    text: TextSpan(
      text: text,
      style: AppTextStyles.medium16.copyWith(color: AppColors.darkerGreen),
      children: [
        TextSpan(
          text: ' *',
          style: AppTextStyles.medium16.copyWith(color: AppColors.lighterRed),
        ),
      ],
    ),
  );
}
