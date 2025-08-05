import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/authentication/data/model/login_request.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/login_bloc_listener.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/remember_me_and_forget_password_section.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/role_identifier.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/sign_in_email_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  UserRole _selectedRole = UserRole.member;

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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpaceScreen(context, 0.07),

                Image.asset(
                  Assets.cisLogo,
                  height: context.setBasedOnScreenHeight(0.1),
                ),
                verticalSpace(8),
                const Text(AppStrings.signIn, style: AppTextStyles.bold24),

                verticalSpaceScreen(context, 0.07),

                Form(
                  key: _signInFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoleIdentifier(
                        selectedRole: _selectedRole,
                        onRoleChanged: (UserRole role) {
                          setState(() {
                            _selectedRole = role;
                          });
                        },
                      ),
                      verticalSpace(24),

                      SignInEmailPassword(
                        passController: _passwordController,
                        emailController: _emailController,
                      ),
                      verticalSpace(24),

                      RememberMeAndForgetPasswordSection(
                        rememberMe: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                      ),
                      verticalSpaceScreen(context, 0.05),

                      CustomButton(
                        onPressed: () {
                          LoginRequest loginRequest = LoginRequest(
                            email: _emailController.text,
                            password: _passwordController.text.trim(),
                            rememberMe: _rememberMe,
                          );

                          if (_signInFormKey.currentState?.validate() ??
                              false) {
                            context.read<AuthCubit>().emitLoginStates(
                              loginRequest: loginRequest,
                              role: _selectedRole,
                            );
                          }
                        },
                        text: AppStrings.signIn,
                        style: AppTextStyles.bold16,
                      ),
                      LoginBlocListener(),
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
