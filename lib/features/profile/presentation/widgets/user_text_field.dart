import 'package:cis_logistics_app/core/helpers/extensions.dart';
import 'package:cis_logistics_app/core/utils/app_colors.dart';
import 'package:cis_logistics_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserTextField extends StatefulWidget {
  const UserTextField({
    super.key,
    this.controller,
    this.isPassword,
    this.validator,
    this.isReadOnly,
    required this.labelText,
  });

  final TextEditingController? controller;
  final bool? isPassword;
  final bool? isReadOnly;
  final String? Function(String?)? validator;
  final String labelText;

  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    if (widget.isPassword == true) {
      _isObscured = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppTextStyles.medium18.copyWith(color: AppColors.lightGreen),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUnfocus,
          readOnly: widget.isReadOnly ?? false,
          style: AppTextStyles.regular16.copyWith(color: AppColors.darkGreen),
          obscureText: widget.isPassword == true ? _isObscured : false,
          decoration: InputDecoration(
            isDense: false,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: context.setBasedOnScreenHeight(0.016),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.lighterRed),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.lighterRed),
            ),
            fillColor: AppColors.lightGray,
            filled: true,
            suffixIcon: widget.isPassword == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.darkGray,
                    ),
                  )
                : null,
          ),
          cursorColor: AppColors.darkGreen,
        ),
      ],
    );
  }
}
