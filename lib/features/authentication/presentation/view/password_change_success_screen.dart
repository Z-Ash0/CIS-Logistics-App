import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PasswordChangeSuccessView extends StatelessWidget {
  const PasswordChangeSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.passChangeSuccess,
                  height: context.setBasedOnScreenHeight(0.15),
                ),

                Padding(
                  padding: EdgeInsets.all(context.setBasedOnScreenHeight(0.02)),
                  child: Column(
                    children: [
                      const Text(
                        AppStrings.passwordChangeSuccessfully,
                        style: AppTextStyles.bold24,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),

                      const Text(
                        AppStrings.pleaseLogin,
                        style: AppTextStyles.regular16,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    context.navigateAndRemoveUntil(Routes.signInScreen);
                  },
                  text: AppStrings.logIn,
                  style: AppTextStyles.medium18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
