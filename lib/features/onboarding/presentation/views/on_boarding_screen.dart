import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/spacers.dart';
import 'package:cis_logistics_app/core/services/hive_service.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //* OnBoarding Image
            SizedBox(
              height: context.setBasedOnScreenHeight(0.45),
              child: onBoardingImage(),
            ),

            //* Text
            Text(
              AppStrings.appDescription,
              style: AppTextStyles.medium20,
              textAlign: TextAlign.center,
            ),

            //* Buttons Section
            _buttonsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buttonsSection(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            HiveService.isFirstTime.put(HiveKeys.kIsFirstTime, false);
            context.navigateAndRemoveUntil(Routes.signInScreen);
          },
          text: AppStrings.next,
        ),
        verticalSpace(16),
        CustomButton(
          onPressed: () => context.navigateAndRemoveUntil(Routes.signInScreen),
          text: AppStrings.skip,
          foregroundColor: AppColors.lightGreen,
          backgroundColor: AppColors.white,
        ),
      ],
    );
  }
}

Widget onBoardingImage() => LayoutBuilder(
  builder: (context, constraints) {
    return Stack(
      children: [
        Image.asset(Assets.onboardingBackground, fit: BoxFit.cover),
        Positioned(
          left: 0,
          right: 20,
          bottom: constraints.maxHeight * 0.15,
          child: SizedBox(
            width: constraints.maxWidth * 0.65,
            height: constraints.maxHeight * 0.65,
            child: Image.asset(Assets.modrekWithQr, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  },
);
