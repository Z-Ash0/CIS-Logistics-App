import 'package:cis_logistics_app/core/helpers/extensions.dart';
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
  final ResetPasswordOtpRequest resetPasswordOtpRequest;
  final bool isFormValid;

  const ResetPasswordOtpBlocConsumer({
    super.key,
    required this.resetPasswordOtpRequest,
    required this.isFormValid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.navigateAndRemoveUntil(Routes.passwordChangeSuccessScreen);
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

        return CustomButton(
          text: AppStrings.continueTxt,
          style: AppTextStyles.bold16,
          onPressed: (isFormValid && !isLoading)
              ? () {
                  context.read<AuthCubit>().emitResetPasswordWithOtpStates(
                    resetPasswordOtpRequest: resetPasswordOtpRequest,
                  );
                }
              : () {}, // Empty callback when disabled
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : null,
        );
      },
    );
  }
}
