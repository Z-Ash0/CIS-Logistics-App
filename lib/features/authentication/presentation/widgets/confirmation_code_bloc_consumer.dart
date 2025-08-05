import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationCodeBlocConsumer extends StatelessWidget {
  const ConfirmationCodeBlocConsumer({
    super.key,
    required this.otpIsValidated,
    required this.otpCode,
    required this.email,
  });
  final bool otpIsValidated;
  final String otpCode;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) => Navigator.pushNamed(
            context,
            Routes.resetPasswordScreen,
            arguments: {'email': email, 'otp': otpCode},
          ),
          failure: (message) => FlushBarUtils.flushBarError(message, context),
        );
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (otpIsValidated) {
              context.read<AuthCubit>().emitVerifyOtpStates(
                email: email,
                otp: otpCode,
              );
            }
          },
          text: AppStrings.verify,
          style: AppTextStyles.bold16,
          child: state.whenOrNull(
            loading: () => const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
