import 'package:cis_logistics_app/core/helpers/theme_extension.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/features/theme/logic/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    bool isSwitchedLight = context.isLight;
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
                horizontalSpace(12),
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
                      context.read<ThemeCubit>().toggleTheme(
                        isSwitchedLight ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                  ),
                ),
                isSwitchedLight
                    ? Icon(
                        CupertinoIcons.sun_max,
                        color: AppColors.lightGreen,
                        size: 28,
                      )
                    : Icon(
                        CupertinoIcons.moon_stars,
                        color: AppColors.lighterGreen,
                        size: 28,
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
