import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/helpers/theme_extension.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgetPasswordSection extends StatelessWidget {
  const RememberMeAndForgetPasswordSection({
    super.key,
    required this.rememberMe,
    this.onChanged,
  });
  final bool rememberMe;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onChanged?.call(!rememberMe),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: rememberMe,
                    onChanged: onChanged,
                    activeColor: AppColors.lightGreen,
                  ),
                ),
              ),
              horizontalSpace(8),
              Text(
                AppStrings.rememberMeLabel,
                style: AppTextStyles.bold12.copyWith(
                  color: context.customColors.requiredTextColor,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => context.navigateTo(Routes.forgotPasswordScreen),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            AppStrings.forgetPasswordQuestion,
            style: AppTextStyles.bold12.copyWith(color: AppColors.lightGreen),
          ),
        ),
      ],
    );
  }
}
