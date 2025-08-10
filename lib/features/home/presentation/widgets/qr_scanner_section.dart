import 'dart:math' as math;

import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_assets.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerSection extends StatelessWidget {
  const QRScannerSection({
    super.key,
    this.onDetect,
    this.scanController,
    required this.isScanning,
    this.startScanner,
    this.stopScanner,
  });
  final void Function(BarcodeCapture)? onDetect;
  final MobileScannerController? scanController;
  final bool isScanning;
  final void Function()? startScanner, stopScanner;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -40,
            top: -90,
            child: Transform.rotate(
              angle: math.pi / 8,
              child: Image.asset(Assets.modrekWelcome, height: 128),
            ),
          ),
          SizedBox(
            width: context.setBasedOnScreenWidth(0.6),
            height: context.setBasedOnScreenHeight(0.4),
            child: Column(
              children: [
                // Scanner Container
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.lightGreen, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: MobileScanner(
                        controller: scanController,
                        onDetect: onDetect,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () => scanController?.toggleTorch(),
              icon: const Icon(Icons.flash_on, color: AppColors.white),
              iconSize: 32,
              tooltip: 'Toggle Flash',
            ),
          ),
        ],
      ),
    );
  }
}
