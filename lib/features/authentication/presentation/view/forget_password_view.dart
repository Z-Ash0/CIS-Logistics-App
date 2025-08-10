import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/app_validators.dart';
import 'package:cis_logistics_app/core/widgets/custom_text_field.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/forget_password_bloc_consumer.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/role_identifier.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/text_field_required_header.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _forgetPasswordFormKey = GlobalKey<FormState>();
  UserRole selectedRole = UserRole.member;

  @override
  void dispose() {
    _emailController.dispose();
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
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                ),

                verticalSpaceScreen(context, 0.07),

                Image.asset(
                  Assets.cisLogo,
                  height: context.setBasedOnScreenHeight(0.1),
                ),

                const SizedBox(height: 8),

                const Text(
                  AppStrings.forgetPassword,
                  style: AppTextStyles.bold24,
                ),

                verticalSpaceScreen(context, 0.05),

                Form(
                  key: _forgetPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoleIdentifier(
                        selectedRole: selectedRole,
                        onRoleChanged: (role) {
                          setState(() {
                            selectedRole = role;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFieldRequiredHeader(AppStrings.emailAddress),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidators.emailValidator,
                      ),
                      verticalSpaceScreen(context, 0.05),

                      ForgetPasswordBlocConsumer(
                        emailController: _emailController,
                        forgetPasswordFormKey: _forgetPasswordFormKey,
                        selectedRole: selectedRole,
                      ),
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
