import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool isSwitchedLight = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => context.navigateTo(Routes.userProfileScreen),
                  child: CircleAvatar(
                    backgroundColor: AppColors.lightGray,
                    child: Image.asset(Assets.user, height: 24),
                  ),
                ),
                horizontalSpace(4),
                Text(
                  '${AppStrings.welcome}, Zash!',
                  style: AppTextStyles.medium18,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    activeColor: AppColors.white,
                    activeTrackColor: AppColors.lightGreen,
                    value: isSwitchedLight,
                    onChanged: (value) {
                      setState(() {
                        isSwitchedLight = value;
                      });
                    },
                  ),
                ),
                isSwitchedLight
                    ? Icon(
                        CupertinoIcons.sun_max,
                        color: AppColors.lightGreen,
                        size: 24,
                      )
                    : Icon(
                        CupertinoIcons.moon_stars,
                        color: AppColors.darkGray,
                        size: 24,
                      ),
              ],
            ),
          ],
        ),
        Image.asset(
          Assets.modrekWelcome,
          height: context.setBasedOnScreenHeight(0.4),
        ),
        SizedBox(),
      ],
    );
  }
}
