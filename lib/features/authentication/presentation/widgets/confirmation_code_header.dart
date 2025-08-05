import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ConfirmationCodeHeader extends StatelessWidget {
  const ConfirmationCodeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.cisLogo,
          height: context.setBasedOnScreenHeight(0.1),
        ),
        verticalSpace(8),
        const Text(AppStrings.confirmationCode, style: AppTextStyles.bold24),
        _buildSubtitle(),
      ],
    );
  }
}

Row _buildSubtitle() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      AppStrings.checkYourEmail,
      style: AppTextStyles.bold16.copyWith(color: AppColors.lightGreen),
    ),
    horizontalSpace(4),
    Image.asset(Assets.modrekCheckEmail, height: 32),
  ],
);
