import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthLoading ||
          current is AuthSuccess ||
          current is AuthFailure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColors.lightGreen),
              ),
            );
          },
          success: (data) {
            context.pop();
            context.navigateAndRemoveUntil(Routes.mainPageScreen);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              FlushBarUtils.customFlushBarWithButtonIcon(
                AppStrings.loginSuccess,
                context,
              );
            });
          },
          failure: (message) {
            context.pop();
            FlushBarUtils.flushBarError(message, context);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
