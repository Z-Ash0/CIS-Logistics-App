import 'package:another_flushbar/flushbar.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FlushBarUtils {
  static void flushBarError(String errorMessage, BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      message: errorMessage,
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: AppColors.lighterRed,
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: AppColors.lighterRed,
    ).show(context);
  }

  static void flushBarSuccess(String successMsg, BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarStyle: FlushbarStyle.FLOATING,
      message: successMsg,
      icon: const Icon(
        Icons.check_circle_outline,
        size: 28.0,
        color: AppColors.lighterGreen,
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: AppColors.lighterGreen,
    ).show(context);
  }

  static void flushBarMsg(String msg, BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarStyle: FlushbarStyle.FLOATING,
      message: msg,
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: AppColors.lightGreen,
    ).show(context);
  }
}
