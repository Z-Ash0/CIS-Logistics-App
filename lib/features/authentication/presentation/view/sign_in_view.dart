import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_cubit.dart';
import 'package:cis_logistics_app/features/authentication/presentation/manager/auth_states.dart';
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpaceScreen(context, 0.07),

                  Image.asset(
                    Assets.cisLogo,
                    height: context.setBasedOnScreenHeight(0.1),
                  ),
                  const SizedBox(height: 8),
                  const Text(AppStrings.signIn, style: AppTextStyles.bold24),

                  verticalSpaceScreen(context, 0.05),

                  Form(
                    key: _signInFormKey,
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          loading: () => true,
                          orElse: () => false,
                        );

                        return AbsorbPointer(
                          absorbing: isLoading,
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
                              const SizedBox(height: 24),

                              SignInEmailPassword(
                                passController: _passwordController,
                                emailController: _emailController,
                              ),
                              const SizedBox(height: 24),

                              RememberMeAndForgetPasswordSection(
                                rememberMe: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                              ),
                              verticalSpaceScreen(context, 0.05),

                              LoginBlocConsumer(
                                formKey: _signInFormKey,
                                emailController: _emailController,
                                passwordController: _passwordController,
                                rememberMe: _rememberMe,
                                selectedRole: _selectedRole,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
