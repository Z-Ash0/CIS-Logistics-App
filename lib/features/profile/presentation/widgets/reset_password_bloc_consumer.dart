import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/profile/data/model/reset_password_request.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_cubit.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocConsumer extends StatelessWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController newPasswordConfirmationController;
  final GlobalKey<FormState> formKey;

  const ResetPasswordBlocConsumer({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.newPasswordConfirmationController,
    required this.formKey,
  });

  void _handlePasswordReset(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      final resetPasswordRequest = ResetPasswordRequest(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
        newPasswordConfirmation: newPasswordConfirmationController.text,
      );

      context.read<UserCubit>().resetPassword(
        resetPasswordRequest: resetPasswordRequest,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) => FlushBarUtils.flushBarSuccess(
            AppStrings.passwordUpdatedSuccessfully,
            context,
          ),
          failure: (errorMessage) =>
              FlushBarUtils.flushBarError(errorMessage, context),
        );
      },
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return CustomButton(
          text: AppStrings.updatePassword,
          style: AppTextStyles.medium16,
          defaultSize: true,
          onPressed: isLoading ? () {} : () => _handlePasswordReset(context),
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : null,
        );
      },
    );
  }
}
