import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:cis_logistics_app/features/profile/presentation/widgets/user_profile_image.dart';
import 'package:cis_logistics_app/features/profile/presentation/widgets/user_text_field.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    _fullNameController.text = 'Zash';
    _emailController.text = 'zfire3005@gmail.com';
    super.initState();
  }

  void _handleLogout() {
    PanaraConfirmDialog.showAnimatedFade(
      context,
      title: AppStrings.logoutConfirmTitle,
      message: AppStrings.logoutConfirmMessage,
      confirmButtonText: AppStrings.logout,
      cancelButtonText: AppStrings.cancel,
      onTapCancel: () {
        context.pop();
      },
      onTapConfirm: () {
        getIt<StorageService>().setIsloggedInValue(false);
        context.navigateAndRemoveUntil(Routes.signInScreen);
      },
      panaraDialogType: PanaraDialogType.custom,
      color: AppColors.lighterRed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              verticalSpaceScreen(context, 0.02),
              UserProfileImage(image: ''),
              verticalSpace(8),
              // Name Display
              Text(
                'ZASH',
                style: AppTextStyles.bold16.copyWith(
                  color: AppColors.lightGreen,
                ),
              ),
              // Form Fields
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.setBasedOnScreenHeight(0.05),
                ),
                child: Column(
                  children: [
                    UserTextField(
                      labelText: AppStrings.fullName,
                      controller: _fullNameController,
                      isReadOnly: true,
                    ),
                    verticalSpace(10),

                    UserTextField(
                      labelText: AppStrings.emailAddress,
                      controller: _emailController,
                      isReadOnly: true,
                    ),

                    verticalSpace(18),
                    CustomButton(
                      text: AppStrings.changePassword,
                      onPressed: () =>
                          context.navigateTo(Routes.changePasswordScreen),
                      style: AppTextStyles.medium16,
                    ),
                  ],
                ),
              ),

              _logOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logOutButton(BuildContext context) {
    return GestureDetector(
      onTap: _handleLogout,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.setBasedOnScreenHeight(0.016),
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.logout, color: AppColors.red),
            SizedBox(width: 8),
            Text(
              AppStrings.logOut,
              style: AppTextStyles.bold16.copyWith(color: AppColors.red),
            ),
          ],
        ),
      ),
    );
  }
}
