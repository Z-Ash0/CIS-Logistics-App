import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldRequiredHeader extends StatelessWidget {
  const TextFieldRequiredHeader(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: AppTextStyles.medium16),
        Text(' *', style: TextStyle(fontSize: 14, color: AppColors.lighterRed)),
      ],
    );
  }
}
