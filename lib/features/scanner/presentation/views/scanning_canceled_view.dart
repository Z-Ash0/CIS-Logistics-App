import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ScanningCanceledView extends StatefulWidget {
  const ScanningCanceledView({super.key});

  @override
  State<ScanningCanceledView> createState() => _ScanningCanceledViewState();
}

class _ScanningCanceledViewState extends State<ScanningCanceledView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FlushBarUtils.flushBarError('QR code is already scanned', context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.modrekScanningCanceled,
                height: context.setBasedOnScreenHeight(0.4),
              ),
              const SizedBox(height: 18),
              Text(
                AppStrings.alreadyCheckedIn,
                style: AppTextStyles.medium18,
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.attendanceWasPreviouslyRecorded,
                style: AppTextStyles.regular16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              CustomButton(
                onPressed: () => context.pop(),
                text: AppStrings.scanAnother,
                style: AppTextStyles.medium18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
