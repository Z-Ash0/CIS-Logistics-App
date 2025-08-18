import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_strings.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:cis_logistics_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';

class AttendanceConfirmedView extends StatefulWidget {
  const AttendanceConfirmedView({super.key});

  @override
  State<AttendanceConfirmedView> createState() =>
      _AttendanceConfirmedViewState();
}

class _AttendanceConfirmedViewState extends State<AttendanceConfirmedView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        FlushBarUtils.flushBarSuccess(
          'QR code is scanned successfully',
          context,
        );
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
                Assets.modrekScanningDone,
                height: context.setBasedOnScreenHeight(0.4),
              ),
              const SizedBox(height: 18),
              Text(
                AppStrings.attendanceConfirmed,
                style: AppTextStyles.medium18,
                textAlign: TextAlign.center,
              ),
              Text(
                AppStrings.successfulQrScanning,
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
