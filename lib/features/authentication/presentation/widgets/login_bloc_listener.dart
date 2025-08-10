import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool rememberMe;
  final UserRole selectedRole;

  const LoginBlocConsumer({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.rememberMe,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthSuccess ||
          current is AuthFailure,
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            // Navigate to MainPageView with Home page (index 0) and show login success
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.mainPageScreen,
              (route) => false,
              arguments: {'initialIndex': 0, 'showLoginSuccess': true},
            );
          },
          failure: (message) {
            FlushBarUtils.flushBarError(message, context);
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
            onPressed: isLoading
                ? () {}
                : () {
                    LoginRequest loginRequest = LoginRequest(
                      email: emailController.text,
                      password: passwordController.text.trim(),
                      rememberMe: rememberMe,
                    );

                    if (formKey.currentState?.validate() ?? false) {
                      context.read<AuthCubit>().emitLoginStates(
                        loginRequest: loginRequest,
                        role: selectedRole,
                      );
                    }
                  },
            text: AppStrings.signIn,
            style: AppTextStyles.bold16,
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
