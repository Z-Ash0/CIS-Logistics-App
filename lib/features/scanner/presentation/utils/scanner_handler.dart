import 'package:cis_logistics_app/core/utils/app_constants.dart';
import 'package:cis_logistics_app/core/utils/flush_bar_utils.dart';
import 'package:flutter/material.dart';

class ScannerHandler {
  static void handleScanResult(
    BuildContext context,
    String code,
    VoidCallback onValidCode,
  ) {
    if (!code.contains('cisteam.org')) {
      FlushBarUtils.flushBarError('Not a valid CIS event QR code', context);
      return;
    }
    onValidCode();
  }

  static void handleSuccess(
    BuildContext context,
    String message,
    VoidCallback resetCubit,
  ) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('registration successful')) {
      Navigator.pushNamed(context, Routes.attendanceConfirmedScreen);
    } else if (lowerMessage.contains('already')) {
      Navigator.pushNamed(context, Routes.scanningCanceledScreen);
    } else {
      FlushBarUtils.flushBarSuccess(message, context);
    }

    _resetAfterDelay(resetCubit);
  }

  static void handleError(
    BuildContext context,
    String error,
    VoidCallback resetCubit,
  ) {
    String message = 'An error occurred';

    if (error.toLowerCase().contains('event has ended') ||
        error.contains('404')) {
      message = 'This event has ended';
    } else if (error.contains('500')) {
      message = 'Invalid QR code';
    } else if (error.toLowerCase().contains('network')) {
      message = 'Network error. Check your connection';
    }

    FlushBarUtils.flushBarError(message, context);
    _resetAfterDelay(resetCubit);
  }

  static void _resetAfterDelay(VoidCallback resetCubit) {
    Future.delayed(const Duration(seconds: 2), resetCubit);
  }
}
