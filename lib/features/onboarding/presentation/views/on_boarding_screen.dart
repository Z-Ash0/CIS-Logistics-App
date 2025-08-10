import 'package:cis_logistics_app/core/di/dependency_injection.dart';
import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/local_storage_extention.dart';
import 'package:cis_logistics_app/core/services/storage_service.dart';
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
            _buttonsSection(() {
              getIt<StorageService>().setIsFirstTimeValue(false);
              context.navigateAndRemoveUntil(Routes.signInScreen);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buttonsSection(VoidCallback onPressed) {
    return Column(
      children: [
        CustomButton(onPressed: onPressed, text: AppStrings.next),
        const SizedBox(height: 16),
        CustomButton(
          onPressed: onPressed,
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
