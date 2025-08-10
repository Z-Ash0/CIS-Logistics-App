import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextBoxes extends StatelessWidget {
  const OtpTextBoxes({
    super.key,
    required this.controllers,
    required this.focusNodes,
    required this.onChanged,
    required this.onKeyPressed,
    this.hasError = false,
    this.errorMessage,
  });

  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final void Function(int, String) onChanged;
  final void Function(int, KeyEvent) onKeyPressed;
  final bool hasError;
  final String? errorMessage;

  static const double _fieldSize = 51.0;
  static const double _borderWidth = 2.0;
  static const double _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(controllers.length, _buildOtpField),
        ),
        if (hasError && errorMessage != null) _buildErrorMessage(),
      ],
    );
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: _fieldSize,
      height: _fieldSize,
      decoration: BoxDecoration(
        border: Border.all(color: _getBorderColor(index), width: _borderWidth),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: (event) => onKeyPressed(index, event),
        child: TextField(
          controller: controllers[index],
          focusNode: focusNodes[index],
          textAlign: TextAlign.center,
          style: AppTextStyles.medium18,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) => onChanged(index, value),
          cursorColor: AppColors.lightGreen,
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          errorMessage!,
          style: AppTextStyles.regular16.copyWith(
            color: Colors.red,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Color _getBorderColor(int index) {
    return hasError && controllers[index].text.isEmpty
        ? Colors.red
        : AppColors.lightGreen;
  }
}
