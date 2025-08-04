import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserWelcomeSkeleton extends StatelessWidget {
  const UserWelcomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.lightGray,
          child: SizedBox(
            width: 38,
            height: 38,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        horizontalSpace(12),
        Container(
          height: 18,
          width: 140,
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
