import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/authentication/data/model/reset_password_otp_request.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordOtpBlocConsumer extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final String email;
  final String Function() getOtpCode;

  const ResetPasswordOtpBlocConsumer({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.email,
    required this.getOtpCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthSuccess ||
          current is AuthFailure ||
          current is AuthLoading,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.navigateAndRemoveUntil(Routes.passwordChangeSuccessScreen);

            WidgetsBinding.instance.addPostFrameCallback((_) {
              FlushBarUtils.flushBarSuccess(
                AppStrings.passwordChangeSuccessfully,
                context,
              );
            });
          },
          failure: (errorMessage) {
            FlushBarUtils.flushBarError(errorMessage, context);
          },
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return AbsorbPointer(
          absorbing: isLoading,
          child: CustomButton(
            text: AppStrings.continueTxt,
            style: AppTextStyles.bold16,
            onPressed: !isLoading
                ? () {
                    if (formKey.currentState?.validate() ?? false) {
                      ResetPasswordOtpRequest resetPasswordOtpRequest =
                          ResetPasswordOtpRequest(
                            email: email,
                            otp: getOtpCode(),
                            password: passwordController.text,
                            passwordConfirmation:
                                confirmPasswordController.text,
                          );
                      context.read<AuthCubit>().emitResetPasswordWithOtpStates(
                        resetPasswordOtpRequest: resetPasswordOtpRequest,
                      );
                    }
                  }
                : () {}, // Empty callback when disabled
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.white,
                      ),
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
