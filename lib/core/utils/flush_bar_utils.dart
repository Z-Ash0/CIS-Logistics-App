import 'package:another_flushbar/flushbar.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FlushBarUtils {
  static void flushBarError(String errorMessage, BuildContext context) {
    _forceHideKeyboard(context);

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
    _forceHideKeyboard(context);

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
    _forceHideKeyboard(context);

    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarStyle: FlushbarStyle.FLOATING,
      message: msg,
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: AppColors.lightGreen,
    ).show(context);
  }

  static void customFlushBarWithButtonIcon(String msg, BuildContext context) {
    _forceHideKeyboard(context);

    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      flushbarStyle: FlushbarStyle.FLOATING,
      icon: const Icon(
        Icons.check_circle_outline,
        size: 28.0,
        color: AppColors.lighterGreen,
      ),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(msg, style: const TextStyle(color: AppColors.white)),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.white, width: 1),
              ),
              child: const Text(
                'Read Instructions',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 5),
      leftBarIndicatorColor: AppColors.lighterGreen,
    ).show(context);
  }

  static void _forceHideKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
