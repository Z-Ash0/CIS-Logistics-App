import 'package:cis_logistics_app/core/enums/user_role.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/helpers/theme_extension.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/features/authentication/presentation/widgets/text_field_required_header.dart';
import 'package:flutter/material.dart';

class RoleIdentifier extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onRoleChanged;

  const RoleIdentifier({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldRequiredHeader(AppStrings.role),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRadioOption(UserRole.head, context),
            _buildRadioOption(UserRole.member, context),
            Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioOption(UserRole role, BuildContext context) {
    final radioButtonUnselectedThemedTextColor =
        context.customColors.radioButtonUnselectedTextColor;

    return Expanded(
      child: GestureDetector(
        onTap: () => onRoleChanged(role),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 10,
                child: Radio<UserRole>(
                  value: role,
                  groupValue: selectedRole,
                  onChanged: (UserRole? value) {
                    if (value != null) {
                      onRoleChanged(value);
                    }
                  },

                  activeColor: AppColors.lightGreen,
                ),
              ),
            ),
            Text(
              role.displayName,
              style: AppTextStyles.medium16.copyWith(
                color: selectedRole == role
                    ? AppColors.lightGreen
                    : radioButtonUnselectedThemedTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
