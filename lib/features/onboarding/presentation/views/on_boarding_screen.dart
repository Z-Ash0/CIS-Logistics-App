import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ZASH', style: AppTextStyles.bold24)),
    );
  }
}
