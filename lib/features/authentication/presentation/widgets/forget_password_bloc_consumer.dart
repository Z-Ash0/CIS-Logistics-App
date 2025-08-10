import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBlocConsumer extends StatelessWidget {
  const ForgetPasswordBlocConsumer({
    super.key,
    required TextEditingController emailController,
    required GlobalKey<FormState> forgetPasswordFormKey,
    required UserRole selectedRole,
  }) : _emailController = emailController,
       _forgetPasswordFormKey = forgetPasswordFormKey,
       _selectedRole = selectedRole;

  final TextEditingController _emailController;
  final GlobalKey<FormState> _forgetPasswordFormKey;
  final UserRole _selectedRole;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (_) {
            final email = _emailController.text;
            _emailController.clear();
            Navigator.pushNamed(
              context,
              Routes.confirmationCodeScreen,
              arguments: email,
            );
          },
          failure: (message) {
            FlushBarUtils.flushBarError(message, context);
          },
        );
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state.maybeWhen(loading: () => true, orElse: () => false),
          child: CustomButton(
            onPressed: () {
              if ((_forgetPasswordFormKey.currentState?.validate() ?? false) &&
                  !state.maybeWhen(loading: () => true, orElse: () => false)) {
                context.read<AuthCubit>().emitForgetPasswordStates(
                  role: _selectedRole,
                  email: _emailController.text,
                );
              }
            },
            text: AppStrings.send,
            style: AppTextStyles.bold16,
            child: state.whenOrNull(
              loading: () => SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: AppColors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
