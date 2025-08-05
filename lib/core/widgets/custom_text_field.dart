import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/helpers/theme_extension.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.isObscured,
    this.hintText,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController? controller;
  final bool? isObscured;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUnfocus,
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      style: TextStyle(color: context.customColors.textFieldInputColor),

      obscureText: widget.isObscured == true ? _obscureText : false,
      decoration: InputDecoration(
        isDense: false,
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.setBasedOnScreenHeight(0.014),
          vertical: context.setBasedOnScreenHeight(0.016),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.regular16,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lightGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lighterGreen),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lighterRed),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.lighterRed),
        ),
        fillColor: context.customColors.textFieldBackgroundColor,
        filled: context.isDark,
        suffixIcon: widget.isObscured ?? false
            ? IconButton(
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.darkGray,
                ),
              )
            : null,
      ),
      cursorColor: AppColors.darkGreen,
    );
  }
}
