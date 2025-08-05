import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_cubit.dart';
import 'package:cis_logistics_app/features/profile/presentation/manager/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocConsumer extends StatelessWidget {
  final String oldPassword;
  final String newPassword;
  final bool isFormValid;

  const ResetPasswordBlocConsumer({
    super.key,
    required this.oldPassword,
    required this.newPassword,
    required this.isFormValid,
  });

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
          onPressed: (isFormValid && !isLoading)
              ? () {
                  context.read<UserCubit>().resetPassword(
                    oldPassword: oldPassword,
                    newPassword: newPassword,
                  );
                }
              : () {},
          child: state.whenOrNull(
            loading: () => SizedBox(
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
