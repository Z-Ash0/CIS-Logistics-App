import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.style,
  });

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 0),
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.lightGreen),
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: foregroundColor ?? AppColors.white,
        backgroundColor: backgroundColor ?? AppColors.lightGreen,
      ),
      child: Text(text, style: style ?? AppTextStyles.bold24),
    );
  }
}
